import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/lesson_description_screen.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/theme/app_colors.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({
    super.key,
  });

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  bool _isAllChecked = false;
  late Function(bool) isChecked;
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
                  child: ActivityCardTile(
                    color: AppColors.primaryDefault,
                    studentIndex: 0,
                    onChecked: (value) {
                      checked[0] = value;
                      _onCardChecked();
                    },
                  ),
                ),
                Expanded(
                  child: ActivityCardTile(
                    color: AppColors.lightOrange,
                    studentIndex: 1,
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
                  child: ActivityCardTile(
                    color: AppColors.lightYellow,
                    studentIndex: 2,
                    onChecked: (value) {
                      checked[2] = value;
                      _onCardChecked();
                    },
                  ),
                ),
                Expanded(
                  child: ActivityCardTile(
                    color: AppColors.lightBlue,
                    studentIndex: 3,
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
    }
    setState(() {
      _isAllChecked = allChecked;
    });
    if (_isAllChecked) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LessonDescriptionScreen()),
      );
    }
  }
}
