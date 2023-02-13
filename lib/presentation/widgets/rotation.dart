import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final angleProvider = StateProvider<double>((ref) => 0.0);

class RotatingContainer extends ConsumerWidget {
  const RotatingContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angle = ref.watch(angleProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: angle,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          IconButton(
            child: Icons.rotate_90_degrees_ccw,
            onPressed: () {
              angle. += 3.14 / 2;
            },
          ),
        ],
      ),
    );
  }
}
