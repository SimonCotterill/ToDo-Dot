import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/widget/taskform.dart';

class AddTaskDialogWidget extends StatefulWidget {
  @override
  _AddTaskDialogWidgetState createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
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
              Text(
                'Add Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              TaskForm(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTask: addTask,
                onDeleteTask: cancelTask,
              ),
            ],
          ),
        ),
      );

  void addTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final task = Task(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        alertTime: DateTime.now().add(new Duration(days: 1)),
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.addTask(task);

      Navigator.of(context).pop();
    }
  }

  void cancelTask() {
    // task never created, return to list page
    Navigator.of(context).pop();
  }
}
