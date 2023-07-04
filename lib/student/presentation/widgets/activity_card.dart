import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/subtitle_text.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/widgets/rotating_row.dart';

class ActivityCardTile extends ConsumerStatefulWidget {
  final Color color;
  final int studentIndex;
  final Function(bool value)? onChecked;

  const ActivityCardTile({
    super.key,
    required this.color,
    required this.studentIndex,
    this.onChecked,
  });

  @override
  _ActivityCardTileState createState() => _ActivityCardTileState();
}

class _ActivityCardTileState extends ConsumerState<ActivityCardTile> {
  @override
  Widget build(BuildContext context) {
    final orientation = ref.watch(orientationProvider);
    final studentName = ref.watch(studentNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
            angle: orientation[widget.studentIndex],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitleText(
                  text: S.current.hi,
                ),
                RegularText(
                  text: studentName.maybeWhen(
                    orElse: () => '',
                    loaded: (name) => name[widget.studentIndex].studentName,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                RegularText(text: S.current.rotate_screen),
                const SizedBox(
                  height: 36,
                ),
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

//ovo sluzi za zadrzavanje statea i orjentacije
final orientationProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0];
});
