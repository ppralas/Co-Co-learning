import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/solutions.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
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
    return GridScreenTemplate(
      widget1: LessonTask(
        studentIndex: 0,
        backgroundColor: AppColors.lightBlue,
        columnColor: AppColors.blue,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
      ),
      widget2: LessonTask(
        studentIndex: 1,
        backgroundColor: AppColors.lightOrange,
        columnColor: AppColors.orange,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
      ),
      widget3: LessonTask(
        studentIndex: 2,
        backgroundColor: AppColors.lightYellow,
        columnColor: AppColors.yellow,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
      ),
      widget4: LessonTask(
        studentIndex: 3,
        backgroundColor: AppColors.veryLightPurple,
        columnColor: AppColors.purple,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
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
