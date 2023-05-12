import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String titleText;
  const TitleText({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        titleText,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 40,
        ),
      ),
    );
  }
}
