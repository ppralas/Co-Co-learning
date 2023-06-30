import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/subtitle_text.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/generated/l10n.dart';

class TaskDescription extends StatefulWidget {
  final Color color;
  const TaskDescription({super.key, required this.color});

  @override
  TaskDescriptionState createState() => TaskDescriptionState(color);
}

class TaskDescriptionState extends State<TaskDescription> {
  final Color color;
  double _rotationAngle = 0;
  bool _isMarked = false;

  TaskDescriptionState(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            120,
            80,
            120,
            80,
          ),
          child: Transform.rotate(
            angle: _rotationAngle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitleText(
                  text: S.current.hi,
                ),
                const RegularText(text: 'Maksimilijan!'),
                const SizedBox(
                  height: 36,
                ),
                RegularText(text: S.current.rotate_screen),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.rotate_right_outlined,
                        size: 60,
                      ),
                      onPressed: () {
                        setState(() {
                          _rotationAngle += pi / 2;
                        });
                      },
                    ),
                    InkWell(
                      radius: 50,
                      onTap: () {
                        setState(() {
                          _isMarked = !_isMarked;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: _isMarked ? Colors.green : Colors.black,
                          size: 60,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
