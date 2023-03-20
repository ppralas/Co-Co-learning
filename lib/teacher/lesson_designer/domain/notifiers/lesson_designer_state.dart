import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/teacher/lesson_designer/data/models/grade.dart';
import 'package:skola/teacher/lesson_designer/data/models/lesson.dart';
import 'package:skola/teacher/lesson_designer/data/models/subject.dart';

part 'lesson_designer_state.freezed.dart';

@freezed
class LessonDesignerState with _$LessonDesignerState {
  const factory LessonDesignerState.initial() = _Initial;
  const factory LessonDesignerState.loading() = _Loading;
  const factory LessonDesignerState.loaded({
    required List<Lesson> lessons,
    required List<Grade> grades,
    required List<Subject> subjects,
  }) = _Loaded;
  const factory LessonDesignerState.error(Failure failure) = _Error;
}
