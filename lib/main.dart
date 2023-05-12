import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/firebase_options.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/widgets/activity_card.dart';
import 'package:skola/student/screens/rotating_screen.dart';
import 'package:skola/student/screens/error_screen.dart';
import 'package:skola/teacher/lesson_designer/presentation/activity_designer_screen.dart';

import 'student/screens/student_initial_screen.dart';
import 'student/screens/text_input_screen.dart';
import 'teacher/lesson_designer/domain/notifiers/lesson_designer_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(lessonDesignerNotifierProvider, (previous, state) {
      state.when(
          initial: () => print('initial'),
          loading: () => print('loading'),
          loaded: (lessons, grades, subjects) =>
              print('$grades, $lessons, $subjects'),
          error: (failure) => print(failure.error));
    });
    return MaterialApp(
      routes: {
        '/': (context) => GridScreen(),
      },
      locale: const Locale("hr"),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
    );
  }
}
