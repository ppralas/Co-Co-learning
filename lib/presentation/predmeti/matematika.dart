import 'package:flutter/material.dart';
import 'package:skola/presentation/widgets/divider.dart';

class Matematika extends StatelessWidget {
  const Matematika({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const ScreenSplitter(),
    );
  }
}
