import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/subtitle_text.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class DescriptionScreen extends ConsumerWidget {
  final Color color;
  final int studentIndex;
  final Function(bool value) onChecked;
  final String? subtitleText;
  final String? descriptionString;

  const DescriptionScreen({
    super.key,
    required this.color,
    required this.studentIndex,
    required this.onChecked,
    this.descriptionString,
    this.subtitleText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = ref.watch(orientationProvider);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
            angle: orientation[studentIndex],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitleText(
                  text: subtitleText.toString(),
                ),
                RegularText(
                  text: ref.watch(studentNotifierProvider).maybeWhen(
                        orElse: () => '',
                        loaded: (name) => name[studentIndex].studentName,
                      ),
                ),
                const SizedBox(
                  height: 36,
                ),
                RegularText(text: descriptionString.toString()),
                const SizedBox(
                  height: 36,
                ),
                RotatingRow(
                  index: studentIndex,
                  onChecked: onChecked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ovo sluzi za zadrzavanje statea i orjentacije
final orientationProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0];
});
