import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/widget/taskform.dart';

import 'sidebar.dart';
import 'package:todo_dot/style.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;

  const EditTaskPage({Key key, @required this.task}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String description;
  DateTime alertTime;

  @override
  void initState() {
    super.initState();

    title = widget.task.title;
    description = widget.task.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(
              headerImage: 'assets/To_Do_Light.png',
              isSubPage: true,
            )),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TaskForm(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTask: saveTask,
              onDeleteTask: deleteTask,
            ),
          ),
        ),
      );

  void saveTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TaskProvider>(context, listen: false);

      provider.updateTask(widget.task, title, description, alertTime);

      Navigator.of(context).pop();
    }
  }

  void deleteTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.removeTask(widget.task);

      Navigator.of(context).pop();
    }
  }
}
