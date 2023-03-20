// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      json['active'] as bool,
      json['class'] as int,
      (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      (json['correct_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['subject'] as String,
      json['subtopic'] as String,
      json['task_description'] as String,
      json['topic'] as String,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'active': instance.active,
      'class': instance.classroom,
      'answers': instance.answers,
      'correct_answers': instance.correctAnswers,
      'subject': instance.subject,
      'subtopic': instance.subtopic,
      'task_description': instance.taskDescription,
      'topic': instance.topic,
    };
