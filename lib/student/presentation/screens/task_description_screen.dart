import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';

import 'package:skola/student/domain/notifiers/lesson_notifier.dart';

import 'package:skola/theme/app_colors.dart';

class LessonDescriptionScreen extends ConsumerWidget {
  const LessonDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonState = ref.watch(lessonNotifierProvider);

    return Scaffold(
      body: Container(
        color: AppColors.lightOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RegularText(text: 'Maksimilijan'),
                RegularText(text: '10:00'),
              ],
            ),
            Center(
              child: RegularText(
                text: lessonState.maybeWhen(
                  loaded: (lessons) => lessons.first.taskDescription,
                  orElse: () => 'kurac',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
