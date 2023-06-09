import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/datasource/firebase_remote_datasource.dart';
import 'package:skola/common/domain/either_failure_or.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/student/data/models/student/student.dart';

final studentRepositoryProvider = Provider<StudentRepository>(
  (ref) => StudentRepositoryImpl(
    ref.watch(firebaseRemoteDataSourceProvider),
  ),
);

abstract class StudentRepository {
  EitherFailureOr<List<Student>> getStudents();
  Future<void> addStudent(
    List<String> names,
  );
}

class StudentRepositoryImpl implements StudentRepository {
  final FirebaseRemoteDataSource _firebaseRemoteDataSource;

  StudentRepositoryImpl(this._firebaseRemoteDataSource);

  @override
  EitherFailureOr<List<Student>> getStudents() async {
    try {
      final studentNames = await _firebaseRemoteDataSource.getStudentNames();
      final students = studentNames.map((name) => Student(name)).toList();
      return right(students);
    } catch (error, stackTrace) {
      return left(
        Failure.generic(
          stackTrace: stackTrace,
          error: error,
        ),
      );
    }
  }

  @override
  Future<void> addStudent(
    List<String> names,
  ) async {
    try {
      await _firebaseRemoteDataSource.postStudentName(
        names,
      );
    } catch (error, stackTrace) {
      throw Failure.generic(
        stackTrace: stackTrace,
        error: error,
      );
    }
  }
}
