import 'package:flutter/material.dart';

class TitleTextBolded extends StatelessWidget {
  final String titleText;
  const TitleTextBolded({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        titleText,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
