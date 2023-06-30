import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/data/models/lesson/lesson.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/presentation/screens/grid_screen.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/lesson_task.dart';
import 'package:skola/theme/app_colors.dart';

// class LessonListView extends ConsumerWidget {
//   const LessonListView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(lessonNotifierProvider);

//     return Scaffold(
//       body: state.when(
//         loaded: (data) => LessonView(
//           lessons: data,
//           isLoading: false,
//         ),
//         error: (failure) {
//           log(failure.toString());
//           return Text(failure.error.toString());
//         },
//         initial: () {
//           return const SizedBox();
//         },
//         loading: () => const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// class LessonView extends ConsumerWidget {
//   final List<Lesson> lessons;
//   final bool isLoading;

//   const LessonView({
//     required this.lessons,
//     required this.isLoading,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (notification) {
//         if (notification.metrics.pixels ==
//             notification.metrics.maxScrollExtent) {
//           ref.read(lessonNotifierProvider.notifier).getLesson();
//         }
//         return true;
//       },
//       child: ListView.separated(
//         itemBuilder: (BuildContext context, int index) {
//           if (index == lessons.length) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final item = lessons[index];
//           return Stack(
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     item.answers.toString(),
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     item.correctAnswers.toString(),
//                     style: const TextStyle(
//                       fontSize: 8,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//         itemCount: lessons.length + (isLoading ? 1 : 0),
//         separatorBuilder: (BuildContext context, int index) => const Divider(),
//       ),
//     );
//   }
// }

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
