import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';

import 'sidebar.dart';
import 'package:todo_dot/style.dart';

//https://pub.dev/packages/circular_check_box
//https://www.youtube.com/watch?v=kN9Yfd4fu04&ab_channel=JohannesMilke

class ToDo extends StatefulWidget {
  ToDo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoState createState() => ToDoState();
}

class ToDoState extends State<ToDo> {
  int selectedIndex = 0;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoList(),
      Container(),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: todoDarkGreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: todoLightGreen,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: todoDarkGreen,
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          child: AddTask(),
          barrierDismissible: false,
        ),
      ),
    );
  }
}

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              )),
          // TODO: Add close button if user doesn't want to add task
          SizedBox(height: 10),
          TaskForm(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedTask: () {
              // save task to database
              // return to To-Do List
            },
          ),
        ],
      ));
}

class TaskForm extends StatelessWidget {
  final String title;
  final String description;
  // final DateTime alarmTime;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTask;

  const TaskForm({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 25),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => Container(
        height: 40.0,
        width: 120,
        decoration: BoxDecoration(
          color: todoDarkGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: onSavedTask,
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
        ),
      );
}

//Other To do stuff

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? Center(
            child: Text(
              'No Tasks',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskWidget(task: task);
            },
          );
  }
}

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({
    @required this.task,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(task.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () {},
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () {},
              icon: Icons.delete,
            ),
          ],
          child: buildTask(context),
        ),
      );

  Widget buildTask(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircularCheckBox(
                value: task.isComplete,
                checkColor: Colors.white,
                activeColor: todoMediumGreen,
                inactiveColor: Colors.redAccent,
                disabledColor: Colors.grey,
                onChanged: (_) {}),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                if (task.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
              ],
            ))
          ],
        ),
      );
}

// onTap: ()=> this.setState(() { this.selected= !this.selected ;}),
