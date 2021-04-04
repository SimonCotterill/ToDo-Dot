import 'package:flutter/material.dart';
import 'package:todo_dot/page/datepicker.dart';
import 'package:todo_dot/style.dart';

class TaskForm extends StatelessWidget {
  final String title;
  final String description;
  final DateTime alertTime;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<DateTime> onChangedAlert;
  final VoidCallback onSavedTask;
  final VoidCallback onCancel;

  const TaskForm({
    Key key,
    this.title = '',
    this.description = '',
    this.alertTime,
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onChangedAlert,
    @required this.onSavedTask,
    @required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 10),
            DatetimePickerWidget(),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSaveButton(),
                buildCancelButton(),
              ],
            )
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
        width: 100,
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
        width: 100,
        decoration: BoxDecoration(
          color: todoDarkGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: onCancel,
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
