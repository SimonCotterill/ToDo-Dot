import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/page/datepicker.dart';
import 'package:todo_dot/widget/todo_list.dart';
import 'package:todo_dot/widget/taskform.dart';
import 'package:todo_dot/database/database.dart';
import 'package:todo_dot/database/utils.dart';
import 'sidebar.dart';
import 'editTask.dart';
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
      CompletedListWidget(),
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
      body: StreamBuilder<List<Task>>(
        stream: Database.readTasks(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TaskProvider>(context);
                provider.setTask(todos);

                return tabs[selectedIndex];
              }
          }
        },
      ),
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
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                )),
            TaskForm(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
            ),
            SizedBox(height: 10),
            DatetimePickerWidget(),
            SizedBox(height: 30),
            TaskFormButtons(
              onSavedTask: addTask,
              onDeleteTask: cancelTask,
            ),

          ],
        ),
      ));
  void addTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Task(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.addTask(todo);

      Navigator.of(context).pop();
    }
  }
}

void cancelTask() {
  // task never created, return to list page
  return;
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
              onTap: () => editTask(context, task),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTask(context, task),
              icon: Icons.delete,
            ),
          ],
          child: buildTask(context),
        ),
      );

  Widget buildTask(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircularCheckBox(
              value: task.isComplete,
              checkColor: Colors.white,
              activeColor: todoMediumGreen,
              inactiveColor: Colors.redAccent,
              disabledColor: Colors.grey,
              onChanged: (_) {
                final provider =
                    Provider.of<TaskProvider>(context, listen: false);
                final isDone = provider.toggleCompleteStatus(task);

                Utils.showSnackBar(
                  context,
                  isDone ? 'Task completed' : 'Task marked incomplete',
                );
              },
            ),
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
                if (task.alertTime != null)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      task.alertTime.toLocal().toString(),
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

  void deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    provider.removeTask(task);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTask(BuildContext context, Task task) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTaskPage(task: task),
        ),
      );
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
