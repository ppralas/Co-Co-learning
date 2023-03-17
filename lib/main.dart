import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skola/firebase_options.dart';
import 'package:skola/izbornik_predmeti.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:skola/teacher/activity_designer_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LessonDesigner(),
      },
    );
  }
}
