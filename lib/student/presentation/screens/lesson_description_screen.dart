import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';

class LessonDescriptionScreen extends ConsumerStatefulWidget {
  const LessonDescriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  LessonDescriptionScreenState createState() =>
      LessonDescriptionScreenState();
}

class LessonDescriptionScreenState
    extends ConsumerState<LessonDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridScreenTemplate(
        widget1: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (students) => students[0].studentName,
                      ),
                ),
              ],
            ),
            RegularText(
              text: ref.watch(lessonNotifierProvider).maybeWhen(
                    loaded: (lessons) => lessons.first.topic,
                    orElse: () => 'Greska',
                  ),
            ),
            const RegularText(text: 'Unutar sljedećih 10 minuta:'),
            RegularText(
              text: ref.watch(lessonNotifierProvider).maybeWhen(
                    loaded: (lessons) => lessons.first.taskDescription,
                    orElse: () => 'Greska',
                  ),
            ),
            // RotatingRow(
            //   index: studentIndex,
            //   onChecked: widget.onChecked,
            // )
          ],
        ),
        widget2: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (students) => students[1].studentName,
                      ),
                ),
              ],
            ),
            RegularText(
              text: ref.watch(lessonNotifierProvider).maybeWhen(
                    loaded: (lessons) => lessons.first.topic,
                    orElse: () => 'Greska',
                  ),
            ),
            const RegularText(text: 'Unutar sljedećih 10 minuta:'),
            Center(
              child: RegularText(
                text: ref.watch(lessonNotifierProvider).maybeWhen(
                      loaded: (lessons) => lessons.first.taskDescription,
                      orElse: () => 'Greska',
                    ),
              ),
            ),
            // RotatingRow(
            //   index: studentIndex,
            //   onChecked: widget.onChecked,
            // )
          ],
        ),
        widget3: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (students) => students[2].studentName,
                      ),
                ),
              ],
            ),
            RegularText(
              text: ref.watch(lessonNotifierProvider).maybeWhen(
                    loaded: (lessons) => lessons.first.topic,
                    orElse: () => 'Greska',
                  ),
            ),
            const RegularText(text: 'Unutar sljedećih 10 minuta:'),
            Center(
              child: RegularText(
                text: ref.watch(lessonNotifierProvider).maybeWhen(
                      loaded: (lessons) => lessons.first.taskDescription,
                      orElse: () => 'Greska',
                    ),
              ),
            ),

            // RotatingRow(
            //   index: studentIndex,
            //   onChecked: widget.onChecked,
            // )
          ],
        ),
        widget4: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (students) => students[3].studentName,
                      ),
                ),
              ],
            ),
            RegularText(
              text: ref.watch(lessonNotifierProvider).maybeWhen(
                    loaded: (lessons) => lessons.first.topic,
                    orElse: () => 'Greska',
                  ),
            ),
            const RegularText(text: 'Unutar sljedećih 10 minuta:'),
            Center(
              child: RegularText(
                text: ref.watch(lessonNotifierProvider).maybeWhen(
                      loaded: (lessons) => lessons.first.taskDescription,
                      orElse: () => 'Greska',
                    ),
              ),
            ),
            // RotatingRow(
            //   index: studentIndex,
            //   onChecked: widget.onChecked,
            // )
          ],
        ),
      ),
    );
  }
}
