import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/presentation/screens/lesson_task_view.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
import 'package:skola/student/presentation/widgets/task_description_card.dart';
import 'package:skola/theme/app_colors.dart';

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
    return Scaffold(
      body: GridScreenTemplate(
        widget1: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(4),
            ),
          ),
          width: double.maxFinite,
          height: double.infinity,
          child: TaskDescriptionCard(
            orientationIndex: 0,
            studentIndex: 0,
            color: AppColors.lightBlue,
            onChecked: (value) {
              checked[0] = value;
              _onCardChecked();
            },
          ),
        ),
        widget2: TaskDescriptionCard(
          orientationIndex: 1,
          studentIndex: 1,
          color: AppColors.lightOrange,
          onChecked: (value) {
            checked[1] = value;
            _onCardChecked();
          },
        ),
        widget3: TaskDescriptionCard(
          orientationIndex: 2,
          studentIndex: 2,
          color: AppColors.lightYellow,
          onChecked: (value) {
            checked[2] = value;
            _onCardChecked();
          },
        ),
        widget4: TaskDescriptionCard(
          orientationIndex: 3,
          studentIndex: 3,
          color: AppColors.lightBlue,
          onChecked: (value) {
            checked[3] = value;
            _onCardChecked();
          },
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
        MaterialPageRoute(builder: (context) => const LessonTaskView()),
      );
    }
  }
}
