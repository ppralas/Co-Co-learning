// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class TaskDescriptionCard extends ConsumerStatefulWidget {
  final int studentIndex;
  final Function(bool value)? onChecked;

  final int orientationIndex;
  final Color color;
  const TaskDescriptionCard({
    required this.studentIndex,
    required this.orientationIndex,
    required this.color,
    this.onChecked,
    super.key,
  });

  @override
  _TaskDescriptionCardState createState() => _TaskDescriptionCardState();
}

class _TaskDescriptionCardState extends ConsumerState<TaskDescriptionCard> {
  late Function(bool) isChecked;
  List<bool> checked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final orientation = ref.watch(orientationProvider);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            120,
            80,
            120,
            80,
          ),
          child: Transform.rotate(
            angle: orientation[widget.orientationIndex],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RegularText(
                      text: ref.watch(studentNotifierProvider).maybeWhen(
                            orElse: () => '',
                            loaded: (students) =>
                                students[widget.studentIndex].studentName,
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
                RegularText(
                  text: S.current.in_next_ten_minutes,
                ),
                RegularText(
                  text: ref.watch(lessonNotifierProvider).maybeWhen(
                        loaded: (lessons) => lessons.first.taskDescription,
                        orElse: () => 'Greska',
                      ),
                ),
                RotatingRow(
                  index: widget.studentIndex,
                  onChecked: widget.onChecked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
