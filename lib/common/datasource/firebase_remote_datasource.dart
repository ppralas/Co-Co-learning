import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skola/teacher/lesson_designer/data/models/grade.dart';
import 'package:skola/teacher/lesson_designer/data/models/lesson.dart';
import 'package:skola/teacher/lesson_designer/data/models/subject.dart';

final firebaseRemoteDataSourceProvider = Provider<FirebaseRemoteDataSource>(
  (ref) => FirebaseRemoteDataSourceImpl(),
);

abstract class FirebaseRemoteDataSource {
  Future<List<Lesson>> getLessons();
  Future<List<Grade>> getGrades();
  Future<List<Subject>> getSubjects();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  DatabaseReference lessonsRef = FirebaseDatabase.instance.ref('lessons');
  DatabaseReference classesRef = FirebaseDatabase.instance.ref('classes');
  DatabaseReference subjectsRef = FirebaseDatabase.instance.ref('subject');

  @override
  Future<List<Lesson>> getLessons() async {
    final response = await lessonsRef.get();
    log(response.value.toString());
    final list = response.children
        .map(
          (e) => Lesson.fromJson(e.value as Map<String, dynamic>),
        )
        .toList();
    log(list.toString());
    return list;
  }

  @override
  Future<List<Grade>> getGrades() async {
    final response = await classesRef.get();
    log(response.value.toString());
    final list = response.children
        .map(
          (e) => Grade(e.value as int),
        )
        .toList();
    log(list.toString());
    return list;
  }

  @override
  Future<List<Subject>> getSubjects() async {
    final response = await subjectsRef.get();
    log(response.value.toString());
    final list = response.children
        .map(
          (e) => Subject(e.value as String),
        )
        .toList();
    log(list.toString());
    return list;
  }
}
