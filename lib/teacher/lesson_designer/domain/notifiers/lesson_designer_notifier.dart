import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/domain/utils/dartz_extension.dart';
import 'package:skola/teacher/lesson_designer/data/repositories/lesson_designer_repository.dart';
import 'package:skola/teacher/lesson_designer/domain/notifiers/lesson_designer_state.dart';

final lessonDesignerNotifierProvider =
    StateNotifierProvider<LessonDesignerNotifier, LessonDesignerState>((ref) {
  return LessonDesignerNotifier(
    ref.watch(lessonDesignerRepositoryProvider),
  )..init();
});

class LessonDesignerNotifier extends StateNotifier<LessonDesignerState> {
  final LessonDesignerRepository _lessonDesignerRepository;
  LessonDesignerNotifier(this._lessonDesignerRepository)
      : super(
          const LessonDesignerState.initial(),
        );
  Future<void> init() async {
    state = const LessonDesignerState.loading();
    final gradesResult = await _lessonDesignerRepository.getGrades();
    final lessonResult = await _lessonDesignerRepository.getLessons();
    final subjectResult = await _lessonDesignerRepository.getSubjects();

    if (gradesResult.isLeft() ||
        lessonResult.isLeft() ||
        subjectResult.isLeft()) {
      state = LessonDesignerState.error(
        gradesResult.isLeft()
            ? gradesResult.asLeft()
            : (lessonResult.isLeft()
                ? lessonResult.asLeft()
                : subjectResult.asLeft()),
      );
      return;
    }
    state = LessonDesignerState.loaded(
      lessons: lessonResult.asRight(),
      grades: gradesResult.asRight(),
      subjects: subjectResult.asRight(),
    );
  }
}
