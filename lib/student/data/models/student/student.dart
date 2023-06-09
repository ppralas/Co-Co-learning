import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends Equatable {
  final String studentName;

  const Student(this.studentName);

  @override
  List<Object?> get props => [
        studentName,
      ];

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
