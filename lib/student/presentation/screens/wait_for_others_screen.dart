import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';

class WaitForOtherScreen extends StatelessWidget {
  const WaitForOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GridScreenTemplate(
      widget1: WaitForOtherScreen(),
      widget2: WaitForOtherScreen(),
      widget3: WaitForOtherScreen(),
      widget4: WaitForOtherScreen(),
    );
  }
}
