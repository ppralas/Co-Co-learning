import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skola/common/domain/entities/failure.dart';
import 'package:skola/student/data/models/student/student.dart';

part 'student_state.freezed.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState.initial() = _Initial;
  const factory StudentState.loading() = _Loading;
  const factory StudentState.loaded({
    required List<Student> students,
  }) = _Loaded;
  const factory StudentState.error(Failure failure) = _Error;
}
