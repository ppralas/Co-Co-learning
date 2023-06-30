import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const RegularText({
    super.key,
    required this.text,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'JosefinSans',
        fontSize: 32,
      ),
    );
  }
}
