import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/teacher/lesson_designer/data/models/grade.dart';

import '../../../generated/l10n.dart';

class ClassPicker extends ConsumerStatefulWidget {
  final Function(Grade) onSelectionChanged;
  final VoidCallback onAddPressed;
  final List<Grade> grades;
  final Grade initialSelection;

  const ClassPicker({
    Key? key,
    required this.onSelectionChanged,
    required this.onAddPressed,
    required this.initialSelection,
    required this.grades,
  }) : super(key: key);

  @override
  ClassPickerState createState() => ClassPickerState();
}

class ClassPickerState extends ConsumerState<ClassPicker> {
  Grade? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleTextBolded(
          titleText: S.current.grade,
        ),
        const SizedBox(width: 16),
        DropdownButton<Grade>(
          value: selectedClass ?? widget.grades.first,
          onChanged: (value) {
            setState(() {
              selectedClass = value!;
            });
            widget.onSelectionChanged(value!);
          },
          items: widget.grades.map((value) {
            return DropdownMenuItem<Grade>(
              value: value,
              child: Text("${value.grade}"),
            );
          }).toList(),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
