import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/title_widget.dart';

class ClassPicker extends StatefulWidget {
  final int initialSelection;
  final Function(int) onSelectionChanged;
  final VoidCallback onAddPressed;

  const ClassPicker({
    super.key,
    required this.initialSelection,
    required this.onSelectionChanged,
    required this.onAddPressed,
  });

  @override
  ClassPickerState createState() => ClassPickerState();
}

class ClassPickerState extends State<ClassPicker> {
  late int _selectedClass;

  @override
  void initState() {
    super.initState();
    _selectedClass = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TitleWidget(titleText: 'Odabir razreda'),
        const SizedBox(width: 16),
        DropdownButton<int>(
          value: _selectedClass,
          onChanged: (value) {
            setState(() {
              _selectedClass = value!;
            });
            widget.onSelectionChanged(value!);
          },
          //ovu listu dohvacat s firebasea
          items: [1, 2, 3, 4].map((value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
