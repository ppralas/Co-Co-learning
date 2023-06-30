import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/data/models/lesson/lesson.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/presentation/screens/grid_screen.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/lesson_task.dart';
import 'package:skola/theme/app_colors.dart';

class LessonTaskView extends StatelessWidget {
  const LessonTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LessonTask(
                    studentIndex: 0,
                    backgroundColor: AppColors.lightBlue,
                    columnColor: AppColors.blue,
                  ),
                ),
                Expanded(
                  child: LessonTask(
                    studentIndex: 1,
                    backgroundColor: AppColors.yellow,
                    columnColor: AppColors.lightYellow,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LessonTask(
                    studentIndex: 2,
                    backgroundColor: AppColors.lightOrange,
                    columnColor: AppColors.orange,
                  ),
                ),
                Expanded(
                  child: LessonTask(
                    studentIndex: 3,
                    backgroundColor: AppColors.veryLightPurple,
                    columnColor: AppColors.lightPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
