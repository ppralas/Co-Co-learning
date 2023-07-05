import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/options_screen.dart';
import 'package:skola/theme/app_colors.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OptionsScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 40, top: 280),
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Icon(
            Icons.settings,
            color: AppColors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
