import 'package:flutter/material.dart';

import '../widgets/divider.dart';

class Priroda extends StatelessWidget {
  const Priroda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: const ScreenSplitter(),
    );
  }
}
