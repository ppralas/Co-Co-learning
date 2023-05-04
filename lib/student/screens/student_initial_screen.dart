import 'package:flutter/material.dart';
import 'package:skola/student/screens/template_screen.dart';
import 'package:skola/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      birdUrlPath: 'Assets/images/bird_default.svg',
      buttonText: 'POKRENI',
      headlineText: 'BOK!',
      subtitleText: 'Dobrodošli u CoCo aplikaciju',
      iconImage: Icon(
        Icons.arrow_right,
        color: AppColors.white,
        size: 90,
      ),
    );
  }
}
