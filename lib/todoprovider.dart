import 'package:flutter/cupertino.dart';
import 'page/todo.dart';
import 'package:provider/provider.dart';

class TodosProvider extends ChangeNotifier{
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
      ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
      ),
    ];

    List<Todo> get todos => _todos.where((todo) => todo.isDone == false ).toList();
}