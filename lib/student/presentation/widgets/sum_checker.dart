import 'dart:math';
import 'package:flutter/material.dart';

class RandomNumberChallenge extends StatefulWidget {
  const RandomNumberChallenge({super.key});

  @override
  RandomNumberChallengeState createState() => RandomNumberChallengeState();
}

class RandomNumberChallengeState extends State<RandomNumberChallenge> {
  late int firstNumber;
  late int secondNumber;
  late int sum;
  late int userInput;

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  void _generateRandomNumbers() {
    setState(() {
      firstNumber = Random().nextInt(100);
      secondNumber = Random().nextInt(100);
      sum = firstNumber + secondNumber;
    });
  }

  void _checkAnswer() {
    if (userInput == sum) {
      _showCorrectDialog();
    } else {
      _showIncorrectDialog();
    }
  }

  void _showCorrectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Correct!'),
          content: const Text('You got it right!'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _generateRandomNumbers();
              },
            ),
          ],
        );
      },
    );
  }

  void _showIncorrectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Incorrect'),
          content: const Text('Try again'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$firstNumber + $secondNumber = ?'),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (input) {
            userInput = int.tryParse(input)!;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _generateRandomNumbers,
              child: const Text('Refresh'),
            ),
          ],
        ),
      ],
    );
  }
}
