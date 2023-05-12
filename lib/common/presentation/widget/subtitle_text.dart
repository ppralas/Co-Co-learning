import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'JosefinSans',
        fontSize: 36,
      ),
    );
  }
}
