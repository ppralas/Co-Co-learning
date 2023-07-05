import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/presentation/screens/exam_done_screen.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
import 'package:skola/student/presentation/widgets/something_wrong_card.dart';
import 'package:skola/theme/app_colors.dart';

class SomethingWrongPage extends ConsumerStatefulWidget {
  const SomethingWrongPage({super.key});

  @override
  _SomethingWrongPageState createState() => _SomethingWrongPageState();
}

class _SomethingWrongPageState extends ConsumerState<SomethingWrongPage> {
  List<bool> checked = [false, false, false, false];
  bool _isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    return GridScreenTemplate(
      widget1: SomethingWoringCard(
        orientationIndex: 0,
        studentIndex: 0,
        color: AppColors.lightBlue,
        onChecked: (value) {
          checked[0] = value;
          _onCardChecked();
        },
      ),
      widget2: SomethingWoringCard(
        orientationIndex: 1,
        studentIndex: 1,
        color: AppColors.lightOrange,
        onChecked: (value) {
          checked[1] = value;
          _onCardChecked();
        },
      ),
      widget3: SomethingWoringCard(
        orientationIndex: 2,
        studentIndex: 2,
        color: AppColors.lightYellow,
        onChecked: (value) {
          checked[2] = value;
          _onCardChecked();
        },
      ),
      widget4: SomethingWoringCard(
        orientationIndex: 3,
        studentIndex: 3,
        color: AppColors.veryLightPurple,
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
        MaterialPageRoute(builder: (context) => const ExamDoneScreen()),
      );
    }
  }
}
