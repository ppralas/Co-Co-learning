import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/student/data/models/lesson.dart';

part 'lesson_state.freezed.dart';

@freezed
class LessonState with _$LessonState {
  const factory LessonState.initial() = _Initial;
  const factory LessonState.loading() = _Loading;
  const factory LessonState.loaded({
    required List<Lesson> lessons,
  }) = _Loaded;
  const factory LessonState.error(Failure failure) = _Error;
}
