import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/database/utils.dart';
import 'package:todo_dot/style.dart';
import 'package:todo_dot/page/editTask.dart';

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
