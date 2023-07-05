import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_regular.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/presentation/screens/end_screen.dart';
import 'package:skola/student/presentation/widgets/button_no_icon.dart';
import 'package:skola/student/presentation/widgets/word_display_card.dart';
import 'package:skola/theme/app_colors.dart';

class SolutionsScreen extends ConsumerWidget {
  const SolutionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonState = ref.watch(lessonNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        titleText: 'Rješenja',
                      ),
                      RegularText(text: 'Pisanje riječi | slova č i ć'),
                    ],
                  ),
                  SvgPicture.asset(
                    'Assets/images/branch.svg', // Replace with your image path
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.veryLightPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 400,
                      width: 500,
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
                                    children: lessons.first.answers
                                        .asMap()
                                        .entries
                                        .map((entry) => WordDisplayCard(
                                              word: entry.value,
                                            ))
                                        .toList(),
                                  ),
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
                        color: AppColors.veryLightPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 400,
                      width: 500,
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
                                            ))
                                        .toList(),
                                  ),
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
              ],
            ),
            const SizedBox(height: 48),
            InkWell(
              child: const ButtonNoIcon(
                buttonText: 'Završi',
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EndScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
