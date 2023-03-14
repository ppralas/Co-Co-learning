import 'package:flutter/material.dart';
import 'package:skola/main%20/app_enviroments.dart';

class StudentLogin extends StatelessWidget {
  final Role role;
  const StudentLogin({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Upisi kod ovdje...',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Unesi'),
            ),
          ],
        ),
      ),
    );
  }
}
