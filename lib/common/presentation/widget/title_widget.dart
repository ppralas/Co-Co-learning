import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;
  const TitleWidget({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        titleText,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
    );
  }
}
