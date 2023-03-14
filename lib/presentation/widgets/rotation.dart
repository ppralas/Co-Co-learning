import 'package:flutter/material.dart';

class RotatingScreen extends StatefulWidget {
  const RotatingScreen({super.key});

  @override
  _RotatingScreenState createState() => _RotatingScreenState();
}

class _RotatingScreenState extends State<RotatingScreen> {
  final List<double> _rotationAngles = [0, 0, 0, 0];

  void _rotateContent(int index) {
    setState(() {
      _rotationAngles[index] +=
          45; // Rotate content by 45 degrees on each button press
    });
  }

  Widget _buildRotatingContainer(int index, Color color, String text) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: color,
            child: Transform.rotate(
              angle: _rotationAngles[index],
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.rotate_left),
            onPressed: () => _rotateContent(index),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildRotatingContainer(
                    0,
                    Colors.grey,
                    'Content 1',
                  ),
                ),
                Expanded(
                  child: _buildRotatingContainer(
                    1,
                    Colors.blueGrey,
                    'Content 2',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildRotatingContainer(
                    2,
                    Colors.brown,
                    'Content 3',
                  ),
                ),
                Expanded(
                  child: _buildRotatingContainer(
                    3,
                    Colors.orange,
                    'Content 4',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
