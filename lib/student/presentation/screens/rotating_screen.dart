import 'package:flutter/material.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/theme/app_colors.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ActivityCardTile(color: AppColors.primaryDefault),
                ),
                Expanded(
                  child: ActivityCardTile(
                    color: AppColors.lightOrange,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ActivityCardTile(color: AppColors.lightYellow),
                ),
                Expanded(
                  child: ActivityCardTile(
                    color: AppColors.lightBlue,
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
