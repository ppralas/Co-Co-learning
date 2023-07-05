import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/presentation/screens/solutions.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
import 'package:skola/student/presentation/widgets/exam_done_card.dart';
import 'package:skola/theme/app_colors.dart';

class ExamDoneScreen extends ConsumerStatefulWidget {
  const ExamDoneScreen({super.key});

  @override
  _ExamDoneScreenState createState() => _ExamDoneScreenState();
}

class _ExamDoneScreenState extends ConsumerState<ExamDoneScreen> {
  bool _isAllChecked = false;
  List<bool> checked = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return GridScreenTemplate(
      widget1: ExamDoneCard(
        color: AppColors.lightBlue,
        studentIndex: 0,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
      ),
      widget2: ExamDoneCard(
        color: AppColors.lightOrange,
        studentIndex: 1,
        onChecked: (value) {
          checked[1] = value;
          _onCardChecked();
        },
      ),
      widget3: ExamDoneCard(
        color: AppColors.lightYellow,
        studentIndex: 2,
        onChecked: (value) {
          checked[2] = value;
          _onCardChecked();
        },
      ),
      widget4: ExamDoneCard(
        color: AppColors.primaryDefault,
        studentIndex: 3,
        onChecked: (value) {
          checked[3] = value;
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
