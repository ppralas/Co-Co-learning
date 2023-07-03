import 'package:flutter/material.dart';

class WordDisplayCard extends StatelessWidget {
  final String word;
  final VoidCallback? onTap;

  const WordDisplayCard({
    Key? key,
    required this.word,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            word,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
