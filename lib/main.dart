import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/firebase_options.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/presentation/widgets/rotation.dart';
import 'package:skola/student/presentation/screens/dragable_test.dart';
import 'package:skola/student/presentation/screens/template_screens/text_template_screen.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/screens/rotating_screen.dart';
import 'package:skola/student/presentation/screens/error_screen.dart';

import 'student/domain/notifiers/lesson_notifier.dart';
import 'student/presentation/screens/student_initial_screen.dart';
import 'student/presentation/screens/name_input_screen.dart';
import 'student/presentation/screens/task_description_screen.dart';

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
    ref.listen(lessonNotifierProvider, (previous, state) {
      state.when(
          initial: () => print('initial'),
          loading: () => print('loading'),
          loaded: (lessons) => print('$lessons,'),
          error: (failure) => print(failure.error));
    });
    return MaterialApp(
      routes: {
        '/': (context) => const LessonDescriptionScreen(),
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
