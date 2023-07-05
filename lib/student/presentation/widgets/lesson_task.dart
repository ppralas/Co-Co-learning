import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/data/models/lesson/lesson.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/screens/exam_done_screen.dart';
import 'package:skola/student/presentation/screens/options_screen.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';
import 'package:skola/student/presentation/widgets/word_display_card.dart';

class LessonTask extends ConsumerStatefulWidget {
  final Color backgroundColor;
  final Color columnColor;
  final Function(bool value)? onChecked;
  final int studentIndex;

  const LessonTask({
    Key? key,
    required this.backgroundColor,
    required this.columnColor,
    required this.studentIndex,
    required this.onChecked,
  }) : super(key: key);

  @override
  LessonTaskState createState() => LessonTaskState();
}

class LessonTaskState extends ConsumerState<LessonTask> {
  late Function(bool) isChecked;
  List<bool> checked = [false, false, false, false];
  List<String> firstColumnItems = [];
  List<String> secondColumnItems = [];

  late Timer countdownTimer;
  late int countdownSeconds;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void startCountdown() {
    final countdownDurationMinutes =
        ref.read(timeProvider); // Retrieve countdown duration in minutes
    final countdownDurationSeconds =
        countdownDurationMinutes * 60; // Convert minutes to seconds
    countdownSeconds =
        countdownDurationSeconds; // Initialize countdownSeconds with the converted duration
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownSeconds--;
        if (countdownSeconds == 0) {
          timer.cancel();
          navigateToSomethingWrongPage();
        }
      });
    });
  }

  void navigateToSomethingWrongPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ExamDoneScreen(),
      ),
    );
  }

  String formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

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

    final isVertical = orientation[widget.studentIndex] == pi / 2 ||
        orientation[widget.studentIndex] == 3 * pi / 2;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: isVertical
              ? const EdgeInsets.fromLTRB(
                  100,
                  0,
                  100,
                  0,
                )
              : const EdgeInsets.fromLTRB(
                  40,
                  20,
                  40,
                  20,
                ),
          child: Transform.rotate(
            angle: orientation[widget.studentIndex],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText(
                            text: ref.watch(studentNotifierProvider).maybeWhen(
                                  orElse: () => '',
                                  loaded: (name) =>
                                      name[widget.studentIndex].studentName,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              lessonState.maybeWhen(
                                loaded: (lessons) =>
                                    lessons.first.taskDescription,
                                orElse: () => S.current.error,
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
                    ),
                    TitleTextBolded(
                      titleText: formatDuration(countdownSeconds),
                    ),
                  ],
                ),
                Flex(
                  direction: isVertical ? Axis.vertical : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: isVertical ? 0 : 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: isVertical ? 150 : 230,
                          width: isVertical ? 400 : 100,
                          decoration: BoxDecoration(
                            color: widget.columnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: lessonState.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (error) =>
                                Center(child: Text(' ${error.toString()}')),
                            loaded: (lessons) {
                              if (lessons.isEmpty) {
                                return const SizedBox();
                              } else {
                                if (firstColumnItems.isEmpty &&
                                    secondColumnItems.isEmpty) {
                                  sameWords(lessons);
                                }

                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: firstColumnItems
                                          .asMap()
                                          .entries
                                          .map(
                                            (entry) => WordDisplayCard(
                                              word: entry.value,
                                              onTap: () => moveToSecondColumn(
                                                entry.key,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                );
                              }
                            },
                            initial: () => const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: isVertical ? 0 : 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: isVertical ? 150 : 230,
                          width: isVertical ? 400 : 100,
                          decoration: BoxDecoration(
                            color: widget.columnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Wrap(
                            children: secondColumnItems
                                .asMap()
                                .entries
                                .map(
                                  (entry) => WordDisplayCard(
                                    word: entry.value,
                                    onTap: () => moveToFirstColumn(
                                      entry.key,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 10,
                  ),
                  child: RotatingRow(
                    index: widget.studentIndex,
                    onChecked: widget.onChecked,
                    text: isVertical
                        ? 'Ako si gotov, pritisni kvačicu\n i pričekaj ostale'
                        : S.current.wait_for_others,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sameWords(List<Lesson> lessons) {
    final random =
        Random(42); // Using a fixed seed for consistent randomization
    final combinedList = lessons.first.answers + lessons.first.correctAnswers;
    firstColumnItems = List.of(combinedList)..shuffle(random);
  }
}
