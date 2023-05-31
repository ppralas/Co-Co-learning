import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/domain/utils/dartz_extension.dart';
import 'package:skola/student/data/repository/lesson_repository_provider.dart';

import 'lesson_state.dart';

final lessonNotifierProvider =
    StateNotifierProvider<LessonDesignerNotifier, LessonState>((ref) {
  return LessonDesignerNotifier(
    ref.watch(lessonRepositoryProvider),
  )..init();
});

class LessonDesignerNotifier extends StateNotifier<LessonState> {
  final LessonRepository _lessonRepository;
  LessonDesignerNotifier(this._lessonRepository)
      : super(
          const LessonState.initial(),
        );
  Future<void> init() async {
    state = const LessonState.loading();
    final lessonResult = await _lessonRepository.getLesson();

    if (lessonResult.isLeft()) {
      log(lessonResult.asLeft().toString());
      state = LessonState.error(lessonResult.asLeft());
    } else {
      state = LessonState.loaded(
        lessons: lessonResult.asRight(),
      );
    }
  }
}
