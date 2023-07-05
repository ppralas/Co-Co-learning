// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/regular_text_bolded.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';

import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class SomethingWoringCard extends ConsumerStatefulWidget {
  final int studentIndex;
  final Function(bool value)? onChecked;

  final int orientationIndex;
  final Color color;
  const SomethingWoringCard({
    required this.studentIndex,
    required this.orientationIndex,
    required this.color,
    this.onChecked,
    super.key,
  });

  @override
  _TaskDescriptionCardState createState() => _TaskDescriptionCardState();
}

class _TaskDescriptionCardState extends ConsumerState<SomethingWoringCard> {
  late Function(bool) isChecked;
  List<bool> checked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final orientation = ref.watch(orientationProvider);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
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
            angle: orientation[widget.orientationIndex],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextBolded(titleText: 'Nešto je krivo!'),
                const RegularText(
                    text:
                        'Imate 5 minuta da raspravite rješenja,pa pokušajte ponovno.'),
                const RegularTextBolded(
                    text: 'U ovom periodu ne možete mjenjati odgovore.'),
                RotatingRow(
                  index: widget.studentIndex,
                  onChecked: widget.onChecked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
