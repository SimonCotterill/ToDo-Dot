import 'package:flutter/cupertino.dart';
import 'utils.dart';

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
