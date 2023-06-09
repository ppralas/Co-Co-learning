//ovo je data

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Lesson extends Equatable {
  final bool active;
  final List<String> answers;
  @JsonKey(name: "class")
  final int classroom;
  final List<String> correctAnswers;
  final String subject;
  final String subtopic;
  final String taskDescription;
  final String topic;

  const Lesson(
    this.active,
    this.classroom,
    this.answers,
    this.correctAnswers,
    this.subject,
    this.subtopic,
    this.taskDescription,
    this.topic,
  );
  @override
  List<Object?> get props => [
        classroom,
        active,
        answers,
        correctAnswers,
        subject,
        subtopic,
        taskDescription,
        topic
      ];

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
