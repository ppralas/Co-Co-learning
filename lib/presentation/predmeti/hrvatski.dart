import 'package:flutter/material.dart';
import 'package:skola/presentation/widgets/divider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hrvatski'),
      ),
      body: const ScreenSplitter(),
    );
  }
}
