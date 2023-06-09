import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/theme/app_colors.dart';

class LessonDescriptionScreen extends ConsumerWidget {
  const LessonDescriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int studentIndex = 1;
    final lessonState = ref.watch(lessonNotifierProvider);

    return Scaffold(
      body: Container(
        color: AppColors.lightOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (students) =>
                            students[studentIndex].studentName,
                      ),
                ),
                const RegularText(text: '10:00'),
              ],
            ),
            Center(
              child: RegularText(
                text: lessonState.maybeWhen(
                  loaded: (lessons) => lessons.first.taskDescription,
                  orElse: () => 'Greska',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
