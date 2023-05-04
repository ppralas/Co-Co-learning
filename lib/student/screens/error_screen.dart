import 'package:flutter/material.dart';
import 'package:skola/student/screens/template_screen.dart';
import 'package:skola/theme/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      headlineText: 'Oh, ne!',
      subtitleText: 'Nešto je pošlo po krivu,\npostavke nisu dohvaćene! ',
      buttonText: 'Ponovo dohvati',
      birdUrlPath: 'Assets/images/sad_bird.svg',
      iconImage: Icon(
        Icons.replay_outlined,
        color: AppColors.white,
        size: 48,
      ),
    );
  }
}
