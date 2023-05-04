import 'package:flutter/material.dart';

class NumberMenu extends StatelessWidget {
  const NumberMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('2'),
              onPressed: () {
                // Handle button press for number 2
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('3'),
              onPressed: () {
                // Handle button press for number 3
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('4'),
              onPressed: () {
                // Handle button press for number 4
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('5'),
              onPressed: () {
                // Handle button press for number 5
              },
            ),
          ],
        ),
      ),
    );
  }
}
