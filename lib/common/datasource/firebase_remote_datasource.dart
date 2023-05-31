import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/data/models/lesson.dart';

final firebaseRemoteDataSourceProvider = Provider<FirebaseRemoteDataSource>(
  (ref) => FirebaseRemoteDataSourceImpl(),
);

abstract class FirebaseRemoteDataSource {
  Future<List<Lesson>> getLesson();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  DatabaseReference lessonsRef = FirebaseDatabase.instance.ref('lessons');

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
}
