import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';
import 'utils.dart';

class Database {
  static Future<String> createTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc();

    task.id = docTask.id;
    await docTask.set(task.toJson());

    return docTask.id;
  }

  static Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('task')
      .orderBy('createdTime', descending: true)
      .snapshots()
      .transform(Utils.transformer(Task.fromJson));

  static Future updateTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc(task.id);

    await docTask.update(task.toJson());
  }

  static Future deleteTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc(task.id);

    await docTask.delete();
  }
}
