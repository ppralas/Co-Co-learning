import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/datasource/firebase_remote_datasource.dart';
import 'package:skola/common/domain/either_failure_or.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/student/data/models/lesson.dart';

final lessonRepositoryProvider = Provider<LessonRepository>(
  (ref) => LessonDesignerRepositoryImpl(
    ref.watch(firebaseRemoteDataSourceProvider),
  ),
);

abstract class LessonRepository {
  EitherFailureOr<List<Lesson>> getLesson();
}

class LessonDesignerRepositoryImpl implements LessonRepository {
  final FirebaseRemoteDataSource _firebaseRemoteDataSource;

  LessonDesignerRepositoryImpl(this._firebaseRemoteDataSource);

  @override
  EitherFailureOr<List<Lesson>> getLesson() async {
    try {
      final lessons = await _firebaseRemoteDataSource.getLesson();
      return right(lessons);
    } catch (e, s) {
      return left(
        Failure.generic(
          stackTrace: s,
          error: e,
        ),
      );
    }
  }
}
