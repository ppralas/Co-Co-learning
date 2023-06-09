import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/data/models/lesson/lesson.dart';

final firebaseRemoteDataSourceProvider = Provider<FirebaseRemoteDataSource>(
  (ref) => FirebaseRemoteDataSourceImpl(),
);

abstract class FirebaseRemoteDataSource {
  Future<List<Lesson>> getLesson();
  Future<void> postStudentName(
    List<String> names,
  );
  Future<List<String>> getStudentNames();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  DatabaseReference lessonsRef = FirebaseDatabase.instance.ref("lessons");
  DatabaseReference studentRef = FirebaseDatabase.instance.ref("student");
//dodat UUID il miliseconds iza "student"
  @override
  Future<List<Lesson>> getLesson() async {
    final response = await lessonsRef.get();
    log(response.value.toString());
    final list = response.children.map(
      (e) {
        log(e.value.toString());
        return Lesson.fromJson(
            Map<String, dynamic>.from(e.value as Map<Object?, Object?>));
      },
    ).toList();

    log(list.toString());
    return list;
  }

  @override
  Future<void> postStudentName(
    List<String> names,
  ) async {
    await studentRef.set(names);
  }

  @override
  Future<List<String>> getStudentNames() async {
    final response = await studentRef.get();
    log(response.value.toString());
    final list = response.children.map(
      (e) {
        log(e.value.toString());
        return e.value.toString();
      },
    ).toList();

    log(list.toString());
    return list;
  }
}
