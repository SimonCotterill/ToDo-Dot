import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_dot/database/database.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/style.dart';
import 'package:todo_dot/widget/taskform.dart';
import 'package:todo_dot/widget/todo_list.dart';

import 'sidebar.dart';

//https://pub.dev/packages/circular_check_box
//https://www.youtube.com/watch?v=kN9Yfd4fu04&ab_channel=JohannesMilke

class ToDo extends StatefulWidget {
  ToDo({
    Key key,
    this.title = '',
  }) : super(key: key);

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
                final tasks = snapshot.data;

                final provider = Provider.of<TaskProvider>(context);
                provider.setTask(tasks);

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
          builder: (BuildContext context) => new AddTask(),
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
  DateTime alertTime;

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
              onChangedAlert: (alertTime) =>
                  setState(() => this.alertTime = alertTime),
              onSavedTask: addTask,
              onCancel: cancelTask,
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
        alertTime: alertTime,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.addTask(todo);

      Navigator.of(context).pop();
    }
  }

  void cancelTask() {
    // task never created, return to list page
    Navigator.of(context).pop();
    return;
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
