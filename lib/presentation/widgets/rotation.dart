import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skola/theme/app_colors.dart';

class RotatingScreen extends StatefulWidget {
  const RotatingScreen({super.key});

  @override
  RotatingScreenState createState() => RotatingScreenState();
}

class RotatingScreenState extends State<RotatingScreen> {
  final List<double> _rotationAngles = [0, 0, 0, 0];

  void _rotateContent(int index) {
    setState(() {
      _rotationAngles[index] +=
          pi / 2; // Rotate content by 45 degrees on each button press
    });
  }

  Widget _buildRotatingContainer(int index, Color color, String text) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: color,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(1, 3),
                )
              ]),
          child: Transform.rotate(
            angle: _rotationAngles[index],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bok,',
                  style: TextStyle(fontSize: 24),
                ),
                const Text(
                  'Zdravko!',
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Rotiraj sekran ako ti ne odgovara, te potvrdi klikom na kvacicu!',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 32,
                ),
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.rotate(
                        angle: _rotationAngles[index],
                        child: IconButton(
                          icon: const Icon(
                            Icons.rotate_left,
                            size: 46,
                          ),
                          onPressed: () => _rotateContent(index),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: color,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.check,
                              color: Colors.black, size: 45),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRotatingContainer(
                      0,
                      AppColors.lightPurple.withOpacity(0.7),
                      'Content 1',
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: _buildRotatingContainer(
                      1,
                      AppColors.lightOrange,
                      'Content 2',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildRotatingContainer(
                    2,
                    AppColors.lightYellow,
                    'Content 3',
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: _buildRotatingContainer(
                    3,
                    AppColors.lightBlue,
                    'Content 4',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
