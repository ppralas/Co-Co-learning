// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';
import 'package:skola/student/presentation/widgets/word_display_card.dart';

class LessonTask extends ConsumerStatefulWidget {
  final Color backgroundColor;
  final Color columnColor;
  final int studentIndex;
  final Function(bool value)? onChecked;

  const LessonTask({
    Key? key,
    required this.backgroundColor,
    required this.columnColor,
    required this.studentIndex,
    this.onChecked,
  }) : super(key: key);

  @override
  LessonTaskState createState() => LessonTaskState();
}

class LessonTaskState extends ConsumerState<LessonTask> {
  List<String> firstColumnItems = [];
  List<String> secondColumnItems = [];

  void moveToSecondColumn(int index) {
    if (index >= 0 && index < firstColumnItems.length) {
      final item = firstColumnItems.removeAt(index);
      secondColumnItems.add(item);
      setState(() {});
    }
  }

  void moveToFirstColumn(int index) {
    if (index >= 0 && index < secondColumnItems.length) {
      final item = secondColumnItems.removeAt(index);
      firstColumnItems.add(item);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = ref.watch(lessonNotifierProvider);
    final orientation = ref.watch(orientationProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Transform.rotate(
          angle: orientation[widget.studentIndex],
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
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
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: RegularText(
                            text: ref.watch(studentNotifierProvider).maybeWhen(
                                  orElse: () => '',
                                  loaded: (name) =>
                                      name[widget.studentIndex].studentName,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            lessonState.maybeWhen(
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
                            color: widget.columnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 270,
                          width: 300,
                          child: lessonState.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (error) => Center(
                                child: Text('Error: ${error.toString()}')),
                            loaded: (lessons) {
                              if (lessons.isEmpty) {
                                return const SizedBox();
                              } else {
                                if (firstColumnItems.isEmpty &&
                                    secondColumnItems.isEmpty) {
                                  firstColumnItems = List.of(
                                      lessons.first.answers +
                                          lessons.first.correctAnswers)
                                    ..shuffle();
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: firstColumnItems
                                        .asMap()
                                        .entries
                                        .map((entry) => WordDisplayCard(
                                              word: entry.value,
                                              onTap: () => moveToSecondColumn(
                                                entry.key,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                );
                              }
                            },
                            initial: () => const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.columnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 270,
                          width: 300,
                          child: Column(
                            children: secondColumnItems
                                .asMap()
                                .entries
                                .map((entry) => WordDisplayCard(
                                      word: entry.value,
                                      onTap: () => moveToFirstColumn(
                                        entry.key,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
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
      ),
    );
  }
}
