import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/input_with_button.dart';
import 'package:skola/teacher/class_picker.dart';
import 'package:skola/teacher/lesson_adder.dart';

class LessonDesigner extends StatelessWidget {
  const LessonDesigner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dizajner lekcija'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClassPicker(
              initialSelection: 1,
              onAddPressed: () {},
              onSelectionChanged: (p0) {},
            ),
            InputWithButton(
              headerText: 'Lekcija',
              buttonText: 'Dodaj lekciju',
              hintText: 'Unesite ime lekcije',
              buttonIcon: Icons.school_outlined,
              onButtonPressed: (p0) {},
            ),
            InputWithButton(
              headerText: 'Podlekcija',
              hintText: 'Unesite ime podlekcije',
              buttonText: 'Dodaj podlekciju',
              buttonIcon: Icons.watch_later,
              onButtonPressed: (p0) {},
            ),
            AddTaskWidget(
              onTaskAdded: (p0) {},
            ),
          ],
        ),
      ),
    );
  }
}
