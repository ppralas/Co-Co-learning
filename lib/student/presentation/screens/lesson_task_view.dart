import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/solutions.dart';
import 'package:skola/student/presentation/widgets/lesson_task.dart';
import 'package:skola/theme/app_colors.dart';

class LessonTaskView extends StatefulWidget {
  const LessonTaskView({Key? key}) : super(key: key);

  @override
  LessonTaskViewState createState() => LessonTaskViewState();
}

class LessonTaskViewState extends State<LessonTaskView> {
  bool _isAllChecked = false;
  List<bool> checked = [false, false, false, false];

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
                    onChecked: (value) {
                      checked[0] = value;
                      _onCardChecked();
                    },
                  ),
                ),
                Expanded(
                  child: LessonTask(
                    studentIndex: 1,
                    backgroundColor: AppColors.yellow,
                    columnColor: AppColors.lightYellow,
                    onChecked: (value) {
                      checked[1] = value;
                      _onCardChecked();
                    },
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
                    onChecked: (value) {
                      checked[2] = value;
                      _onCardChecked();
                    },
                  ),
                ),
                Expanded(
                  child: LessonTask(
                    studentIndex: 3,
                    backgroundColor: AppColors.veryLightPurple,
                    columnColor: AppColors.lightPurple,
                    onChecked: (value) {
                      checked[3] = value;
                      _onCardChecked();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
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
      setState(() {
        _isAllChecked = allChecked;
      });
      if (_isAllChecked) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SolutionsScreen()),
        );
      }
    }
  }
}
