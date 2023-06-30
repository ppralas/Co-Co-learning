import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class LessonTask extends ConsumerWidget {
  final Color backgroundColor;
  final Color columnColor;
  final int studentIndex;

  const LessonTask({
    super.key,
    required this.backgroundColor,
    required this.columnColor,
    required this.studentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RegularText(
                          text: ref.watch(studentNotifierProvider).maybeWhen(
                                orElse: () => '',
                                loaded: (name) =>
                                    name[studentIndex].studentName,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          ref.watch(lessonNotifierProvider).maybeWhen(
                                loaded: (lessons) =>
                                    lessons.first.taskDescription,
                                orElse: () => 'Greska',
                              ),
                          maxLines: 2,
                          style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const TitleTextBolded(
                    titleText: '10:00',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: columnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 270,
                        width: 300,
                        child: const Text('Test'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: columnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 270,
                        width: 300,
                        child: const Text('Test'),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 10,
                ),
                child: RotatingRow(
                  index: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
