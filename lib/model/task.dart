import 'package:flutter/cupertino.dart';
import 'package:todo_dot/database/database.dart';
import 'package:todo_dot/database/utils.dart';

// https://github.com/JohannesMilke/todo_app_firestore_example
class Task {
  DateTime createdTime;
  String title;
  String id;
  String description;
  DateTime alertTime;
  bool isComplete;

  Task({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.alertTime,
    this.id,
    this.isComplete = false,
  });

  static Task fromJson(Map<String, dynamic> json) => Task(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        alertTime: Utils.toDateTime(json['alertTime']),
        isComplete: json['isComplete'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'alertTime': Utils.fromDateTimeToJson(alertTime),
        'isComplete': isComplete
      };
}

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks =>
      _tasks.where((task) => task.isComplete == false).toList();

  List<Task> get tasksCompleted =>
      _tasks.where((task) => task.isComplete == true).toList();

  void setTask(List<Task> tasks) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _tasks = tasks;
        notifyListeners();
      });

  void addTask(Task task) => Database.createTask(task);

  void removeTask(Task task) => Database.deleteTask(task);

  bool toggleCompleteStatus(Task task) {
    task.isComplete = !task.isComplete;
    Database.updateTask(task);

    return task.isComplete;
  }

  void updateTask(
      Task task, String title, String description, DateTime alertTime) {
    task.title = title;
    task.description = description;
    task.alertTime = alertTime;

    Database.updateTask(task);
  }
}
