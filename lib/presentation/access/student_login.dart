import 'package:flutter/material.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({
    super.key,
  });

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
