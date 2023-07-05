import 'package:flutter/material.dart';

class RegularTextBolded extends StatelessWidget {
  final String text;
  final double? fontSize;
  const RegularTextBolded({
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
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
