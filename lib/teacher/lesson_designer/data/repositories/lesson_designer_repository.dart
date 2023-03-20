import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/datasource/firebase_remote_datasource.dart';
import 'package:skola/common/domain/either_failure_or.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/teacher/lesson_designer/data/models/grade.dart';
import 'package:skola/teacher/lesson_designer/data/models/subject.dart';
import 'package:skola/teacher/lesson_designer/data/models/lesson.dart';

final lessonDesignerRepositoryProvider = Provider<LessonDesignerRepository>(
  (ref) => LessonDesignerRepositoryImpl(
    ref.watch(firebaseRemoteDataSourceProvider),
  ),
);

abstract class LessonDesignerRepository {
  EitherFailureOr<List<Grade>> getGrades();
  EitherFailureOr<List<Subject>> getSubjects();
  EitherFailureOr<List<Lesson>> getLessons();
}

class LessonDesignerRepositoryImpl implements LessonDesignerRepository {
  final FirebaseRemoteDataSource _firebaseRemoteDataSource;

  LessonDesignerRepositoryImpl(this._firebaseRemoteDataSource);

  @override
  EitherFailureOr<List<Grade>> getGrades() async {
    try {
      final grades = await _firebaseRemoteDataSource.getGrades();
      return right(grades);
    } catch (e, s) {
      return left(
        Failure.generic(
          stackTrace: s,
          error: e,
        ),
      );
    }
  }

  @override
  EitherFailureOr<List<Lesson>> getLessons() async {
    try {
      final lessons = await _firebaseRemoteDataSource.getLessons();
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

  @override
  EitherFailureOr<List<Subject>> getSubjects() async {
    try {
      final subjects = await _firebaseRemoteDataSource.getSubjects();
      return right(subjects);
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
