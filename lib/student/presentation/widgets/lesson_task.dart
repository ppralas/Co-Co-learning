// ignore_for_file: must_be_immutable

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

  LessonTask({
    Key? key,
    required this.backgroundColor,
    required this.columnColor,
    required this.studentIndex,
  }) : super(key: key);

  List<String> firstColumnItems = [];
  List<String> secondColumnItems = [];

  void moveToSecondColumn(int index) {
    if (index >= 0 && index < firstColumnItems.length) {
      final item = firstColumnItems.removeAt(index);
      secondColumnItems.add(item);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonState = ref.watch(lessonNotifierProvider);

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
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
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
                        child: lessonState.when(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (error) =>
                              Center(child: Text('Error: ${error.toString()}')),
                          loaded: (lessons) {
                            if (lessons.isEmpty) {
                              return const SizedBox();
                            } else {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: lessons.first.correctAnswers
                                          .asMap()
                                          .entries
                                          .map((entry) => WordDisplayCard(
                                                word: entry.value,
                                                onTap: () => moveToSecondColumn(
                                                    entry.key),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  Wrap(
                                    children: lessons.first.answers
                                        .asMap()
                                        .entries
                                        .map((entry) => WordDisplayCard(
                                              word: entry.value,
                                              onTap: () =>
                                                  moveToSecondColumn(entry.key),
                                            ))
                                        .toList(),
                                  ),
                                ],
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
                          color: columnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 270,
                        width: 300,
                        child: Column(
                          children: secondColumnItems
                              .map((item) => Text(item))
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
    );
  }
}

class WordDisplayCard extends StatelessWidget {
  final String word;
  final VoidCallback? onTap;

  const WordDisplayCard({
    Key? key,
    required this.word,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            word,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
