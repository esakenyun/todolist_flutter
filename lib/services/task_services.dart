import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/model/task_model.dart';

class TaskService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //CRUD Operations

  // CREATE
  void addNewTask(TaskModel model) {
    todoCollection.add(model.toMap());
  }
}
