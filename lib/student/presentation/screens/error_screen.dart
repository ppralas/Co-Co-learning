import 'package:flutter/material.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/presentation/screens/template_screens/template_screen.dart';
import 'package:skola/theme/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      headlineText: S.current.oh_no,
      subtitleText: S.current.error_screen_message,
      buttonText: S.current.get_again,
      birdUrlPath: 'Assets/images/sad_bird.svg',
      iconImage: Icon(
        Icons.replay_outlined,
        color: AppColors.white,
        size: 48,
      ),
    );
  }
}
