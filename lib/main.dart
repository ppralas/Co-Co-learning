import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/firebase_options.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/presentation/screens/lesson_task_view.dart';
import 'package:skola/student/presentation/screens/student_initial_screen.dart';

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
          initial: () => log('initial'),
          loading: () => log('loading'),
          loaded: (lessons) => log('$lessons,'),
          error: (failure) => log(failure.error));
    });
    return MaterialApp(
      routes: {
        '/': (context) => const LessonTaskView(),
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
