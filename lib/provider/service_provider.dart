import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/model/task_model.dart';
import 'package:todolist/services/task_services.dart';

final serviceProvider = StateProvider<TaskService>((ref) {
  return TaskService();
});

final currentUserProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final fetchStreamProvider = StreamProvider<List<TaskModel>>((ref) async* {
  final currentUser = ref.watch(currentUserProvider);
  final userId = currentUser?.uid ?? '';
  final getData = FirebaseFirestore.instance
      .collection('todoApp')
      .where('userUid', isEqualTo: userId)
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TaskModel.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
