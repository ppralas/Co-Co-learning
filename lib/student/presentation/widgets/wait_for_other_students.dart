import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';

class WaitForOtherStudents extends ConsumerWidget {
  final int studentIndex;
  const WaitForOtherStudents(this.studentIndex, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentName = ref.read(studentNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              RegularText(
                text: studentName.maybeWhen(
                  orElse: () => '',
                  loaded: (students) => students[studentIndex].studentName,
                ),
              ),
              const RegularText(text: '10:00')
            ],
          ),
          const TitleTextBolded(titleText: 'Bravo!'),
          const RegularText(text: 'Pričekaj da ostali završe.'),
        ],
      ),
    );
  }
}
