import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/common/domain/utils/dartz_extension.dart';
import 'package:skola/student/data/models/student/student.dart';
import 'package:skola/student/data/repository/student_repository/student_repository_provider.dart';

import 'student_state.dart';

final studentNotifierProvider =
    StateNotifierProvider<StudentNotifier, StudentState>((ref) {
  return StudentNotifier(
    ref.watch(studentRepositoryProvider),
  )..init();
});

class StudentNotifier extends StateNotifier<StudentState> {
  final StudentRepository _studentRepository;
  StudentNotifier(this._studentRepository)
      : super(
          StudentState.initial(),
        );
  Future<void> init() async {
    state = const StudentState.loading();
    final studentResult = await _studentRepository.getStudents();

    if (studentResult.isLeft()) {
      log(studentResult.asLeft().toString());
      state = StudentState.error(studentResult.asLeft());
    } else {
      state = StudentState.loaded(
        students: studentResult.asRight(),
      );
    }
  }

  Future<void> addStudent(List<String> names) async {
    try {
      await _studentRepository.addStudent(names);
      final studentResult = await _studentRepository.getStudents();

      if (studentResult.isLeft()) {
        log(studentResult.asLeft().toString());
        state = StudentState.error(studentResult.asLeft());
      } else {
        state = StudentState.loaded(
          students: studentResult.asRight(),
        );
      }
    } catch (e, s) {
      log(e.toString());
      state = StudentState.error(
        Failure.generic(
          stackTrace: s,
          error: e,
        ),
      );
    }
  }
}
