import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            buildDateTimePicker(),
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

  Widget buildDateTimePicker() {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarm Date and Time',
            // change color to match text fields title
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
      DateTimeField(
        format: format,
        onChanged: onChangedAlert,
        initialValue: alertTime,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              // set color to theme dark green
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: todoDarkGreen,
                    ),
                  ),
                  child: child,
                );
              },
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              // set color to theme dark green
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: todoDarkGreen,
                    ),
                  ),
                  child: child,
                );
              },
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }

  Widget buildSaveButton() => Container(
        height: 40.0,
        width: 100,
        decoration: BoxDecoration(
          color: todoDarkGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          // deprecated flat button style
          style: TextButton.styleFrom(
            primary: Colors.black87,
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
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
        child: TextButton(
          // deprecated flat button style
          style: TextButton.styleFrom(
            primary: Colors.black87,
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
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
