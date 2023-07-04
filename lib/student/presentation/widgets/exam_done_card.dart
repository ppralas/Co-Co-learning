import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';

class ExamDoneCard extends StatelessWidget {
  const ExamDoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleTextBolded(titleText: 'Vježba je gotova!'),
          RegularText(text: 'Idemo vidjeti tvoje rezultate!'),
        ],
      ),
    );
  }
}
