import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skola/student/data/repository/lesson_repository/lesson_repository_provider.dart';

import 'lesson_state.dart';

final lessonNotifierProvider =
    StateNotifierProvider<LessonDesignerNotifier, LessonState>((ref) {
  return LessonDesignerNotifier(
    ref.watch(lessonRepositoryProvider),
  )..getLesson();
});

class LessonDesignerNotifier extends StateNotifier<LessonState> {
  final LessonRepository _lessonRepository;

  LessonDesignerNotifier(this._lessonRepository)
      : super(const LessonState.initial());

  Future<void> getLesson() async {
    state = const LessonState.loading();
    final lessonResult = await _lessonRepository.getLesson();

    lessonResult.fold(
      (failure) {
        log(failure.toString());
        state = LessonState.error(failure);
      },
      (lessons) {
        state = LessonState.loaded(lessons: lessons);
      },
    );
  }
}
