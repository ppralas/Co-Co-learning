import 'package:flutter/material.dart';
import 'package:skola/presentation/widgets/divider.dart';

class Likovni extends StatelessWidget {
  const Likovni({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const ScreenSplitter(),
    );
  }
}
