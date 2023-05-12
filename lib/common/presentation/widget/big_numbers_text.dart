import 'package:flutter/material.dart';

class TextWidgetRegular extends StatelessWidget {
  final String text;
  const TextWidgetRegular({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'JosefinSans',
        fontSize: 50,
      ),
    );
  }
}
