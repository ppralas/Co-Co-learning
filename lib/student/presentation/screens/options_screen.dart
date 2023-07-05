import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/student/presentation/screens/welcome_screen.dart';
import 'package:skola/student/presentation/widgets/button_no_icon.dart';

class OptionsScreen extends ConsumerWidget {
  final TextEditingController _timeController = TextEditingController();

  OptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Vrijeme rješavanja vježbe je'),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Unesite vrijeme (u minutama3)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  final intValue = int.tryParse(value);
                  ref.watch(timeProvider.notifier).state = intValue ?? 0;
                },
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              child: const ButtonNoIcon(
                buttonText: 'Potvrdi',
              ),
              onTap: () {
                ref.read(timeProvider);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

final timeProvider = StateProvider<int>((ref) => 0);
