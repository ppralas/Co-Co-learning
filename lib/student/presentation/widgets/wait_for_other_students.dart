import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';

class WaitForOtherStudents extends ConsumerWidget {
  final int studentIndex;
  final Function(bool value)? onChecked;
  final int orientationIndex;
  final Color color;
  const WaitForOtherStudents({
    required this.studentIndex,
    required this.orientationIndex,
    required this.color,
    this.onChecked,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = ref.watch(orientationProvider);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            120,
            80,
            120,
            80,
          ),
          child: Transform.rotate(
            angle: orientation[orientationIndex],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextBolded(titleText: 'Bravo!'),
                RegularText(text: 'Pricekaj ostale da zavrse!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
