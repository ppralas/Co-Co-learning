import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/title_widget.dart';
import 'package:skola/teacher/lesson_designer/data/models/subject.dart';

import '../../../generated/l10n.dart';

class SubjectPicker extends ConsumerStatefulWidget {
  final Function(Subject) onSelectionChanged;
  final VoidCallback onAddPressed;
  final List<Subject> subjects;
  final Subject initialSelection;

  const SubjectPicker({
    Key? key,
    required this.onSelectionChanged,
    required this.onAddPressed,
    required this.initialSelection,
    required this.subjects,
  }) : super(key: key);

  @override
  SubjectPickerState createState() => SubjectPickerState();
}

class SubjectPickerState extends ConsumerState<SubjectPicker> {
  Subject? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleWidget(
          titleText: S.current.subject,
        ),
        const SizedBox(width: 16),
        DropdownButton<Subject>(
          value: selectedSubject ?? widget.subjects.first,
          onChanged: (value) {
            setState(() {
              selectedSubject = value!;
            });
            widget.onSelectionChanged(value!);
          },
          items: widget.subjects.map((value) {
            return DropdownMenuItem<Subject>(
              value: value,
              child: Text(value.subject),
            );
          }).toList(),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
