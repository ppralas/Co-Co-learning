import 'dart:developer' as dev;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/firebase_options.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/domain/lesson_notifiers/lesson_notifier.dart';
import 'package:skola/student/presentation/screens/exam_done.dart';
import 'package:skola/student/presentation/screens/lesson_description_screen.dart';
import 'package:skola/student/presentation/screens/lesson_task_view.dart';
import 'package:skola/student/presentation/screens/solutions.dart';
import 'package:skola/student/presentation/screens/welcome_screen.dart';

import 'dart:math';

import 'package:skola/student/presentation/widgets/lesson_task.dart';
import 'package:skola/student/presentation/widgets/task_description.dart';

String generateDeviceId() {
  final Random random = Random();
  const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final String deviceId =
      List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  return deviceId;
}

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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String deviceId = generateDeviceId();
    dev.log('Generated Device ID: $deviceId');

    ref.listen(lessonNotifierProvider, (previous, state) {
      state.when(
          initial: () => dev.log('initial'),
          loading: () => dev.log('loading'),
          loaded: (lessons) => dev.log('$lessons,'),
          error: (failure) => dev.log(failure.error));
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
