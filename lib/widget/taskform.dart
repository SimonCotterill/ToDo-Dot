import 'package:flutter/material.dart';
import 'package:todo_dot/style.dart';

class TaskForm extends StatelessWidget {
  final String title;
  final String description;
  final DateTime alarmTime;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTask;
  final VoidCallback onDeleteTask;

  const TaskForm({
    Key key,
    this.title = '',
    this.description = '',
    this.alarmTime,
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTask,
    @required this.onDeleteTask,
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
            buildSaveButton(),
            SizedBox(height: 25),
            buildCancelButton(),
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

  Widget buildSaveButton() => Container(
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

  Widget buildCancelButton() => Container(
        height: 40.0,
        width: 120,
        decoration: BoxDecoration(
          color: todoDarkGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: onDeleteTask,
          child: Center(
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
        ),
      );
}
