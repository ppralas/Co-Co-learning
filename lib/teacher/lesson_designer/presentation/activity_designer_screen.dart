import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/input_with_button.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/teacher/lesson_designer/data/models/grade.dart';
import 'package:skola/teacher/lesson_designer/data/models/subject.dart';
import 'package:skola/teacher/lesson_designer/domain/notifiers/lesson_designer_notifier.dart';
import 'package:skola/teacher/lesson_designer/presentation/class_picker.dart';
import 'package:skola/teacher/lesson_designer/presentation/lesson_adder.dart';
import 'package:skola/teacher/lesson_designer/presentation/subject_picker.dart';

class LessonDesigner extends ConsumerStatefulWidget {
  const LessonDesigner({super.key});

  @override
  LessonDesignerState createState() => LessonDesignerState();
}

class LessonDesignerState extends ConsumerState<LessonDesigner> {
  Grade? selectedClass;
  Subject? slectedSubject;

  @override
  Widget build(BuildContext context) {
    final lessonDesignerState = ref.watch(lessonDesignerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.lesson_designer),
      ),
      body: lessonDesignerState.when(
        error: (failure) => Text(S.current.error),
        initial: () => const SizedBox(),
        loading: () => const CircularProgressIndicator(),
        loaded: (lessons, grades, subjects) => Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  ClassPicker(
                    initialSelection: selectedClass ?? const Grade(1),
                    onAddPressed: () {},
                    onSelectionChanged: (grade) {
                      selectedClass = grade;
                    },
                    grades: grades,
                  ),
                  SubjectPicker(
                      onSelectionChanged: (subject) {
                        slectedSubject = subject;
                      },
                      onAddPressed: () {},
                      initialSelection:
                          slectedSubject ?? const Subject('Matematika'),
                      subjects: subjects)
                ],
              ),
              InputWithButton(
                headerText: S.current.lesson,
                buttonText: S.current.lesson_add,
                hintText: S.current.lesson_name,
                buttonIcon: Icons.school_outlined,
                onButtonPressed: (p0) {},
              ),
              InputWithButton(
                headerText: S.current.sublesson,
                hintText: S.current.sublesson_name,
                buttonText: S.current.add_sublesson,
                buttonIcon: Icons.watch_later,
                onButtonPressed: (p0) {},
              ),
              AddTaskWidget(
                onTaskAdded: (p0) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
