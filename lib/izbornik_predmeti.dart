import 'package:flutter/material.dart';
import 'package:skola/presentation/predmeti/hrvatski.dart';
import 'package:skola/presentation/predmeti/matematika.dart';
import 'package:skola/presentation/predmeti/priroda.dart';

import 'presentation/predmeti/likovni.dart';

class Izbornik extends StatelessWidget {
  const Izbornik({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Skolska aplikacija'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.plus_one),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Matematika'),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Matematika(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Hrvatski'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Hrvatski()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Priroda'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Priroda()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Likovni'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Likovni()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
