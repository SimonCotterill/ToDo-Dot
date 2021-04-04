import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/page/todo.dart';

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

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.tasksCompleted;

    return tasks.isEmpty
        ? Center(
            child: Text(
              'No completed tasks',
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
