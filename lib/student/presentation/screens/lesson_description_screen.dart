import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class LessonDescriptionScreen extends ConsumerStatefulWidget {
  const LessonDescriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  LessonDescriptionScreenState createState() => LessonDescriptionScreenState();
}

class LessonDescriptionScreenState
    extends ConsumerState<LessonDescriptionScreen> {
  bool _isAllChecked = false;
  late Function(bool) isChecked;
  List<bool> checked = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final orientation = ref.watch(orientationProvider);
    return Scaffold(
      body: GridScreenTemplate(
        widget1: Transform.rotate(
          angle: orientation[0],
          child: Column(
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
              RotatingRow(
                index: 0,
                onChecked: (value) {
                  checked[0] = value;
                  _onCardChecked();
                },
              ),
            ],
          ),
        ),
        widget2: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            RotatingRow(
              index: 1,
              onChecked: (_) => _onCardChecked(),
            ),
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
            RotatingRow(
              index: 2,
              onChecked: (_) => _onCardChecked(),
            ),
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
            RotatingRow(
              index: 3,
              onChecked: (_) => _onCardChecked(),
            ),
          ],
        ),
      ),
    );
  }

  void _onCardChecked() {
    bool allChecked = true;
    for (int i = 0; i < 4; i++) {
      if (!checked[i]) {
        allChecked = false;
        break;
      }
    }
    setState(() {
      _isAllChecked = allChecked;
    });
    if (_isAllChecked) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LessonDescriptionScreen()),
      );
    }
  }
}

// class LessonDescriptionCard extends StatelessWidget {
//   const LessonDescriptionCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: orientation[0],
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               RegularText(
//                 text: ref.watch(studentNotifierProvider).maybeWhen(
//                       orElse: () => '',
//                       loaded: (students) => students[0].studentName,
//                     ),
//               ),
//             ],
//           ),
//           RegularText(
//             text: ref.watch(lessonNotifierProvider).maybeWhen(
//                   loaded: (lessons) => lessons.first.topic,
//                   orElse: () => 'Greska',
//                 ),
//           ),
//           const RegularText(text: 'Unutar sljedećih 10 minuta:'),
//           RegularText(
//             text: ref.watch(lessonNotifierProvider).maybeWhen(
//                   loaded: (lessons) => lessons.first.taskDescription,
//                   orElse: () => 'Greska',
//                 ),
//           ),
//           RotatingRow(
//             index: 0,
//             onChecked: (value) {
//               checked[0] = value;
//               _onCardChecked();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
