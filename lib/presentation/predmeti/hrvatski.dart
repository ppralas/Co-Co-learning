import 'package:flutter/material.dart';
import 'package:skola/presentation/widgets/divider.dart';

class Hrvatski extends StatelessWidget {
  const Hrvatski({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: const ScreenSplitter(),
    );
  }
}
