// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';

class RotatingRow extends ConsumerStatefulWidget {
  final int index;
  final Function(bool value)? onChecked;
  final String? text;
  const RotatingRow({
    super.key,
    required this.index,
    this.onChecked,
    this.text,
  });

  @override
  _RotatingRowState createState() => _RotatingRowState();
}

class _RotatingRowState extends ConsumerState<RotatingRow> {
  bool _isMarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.rotate_right_outlined,
            size: 60,
          ),
          onPressed: () {
            final orientation = List.of(
              ref.read(orientationProvider),
            );
            orientation[widget.index] += pi / 2;
            if (orientation[widget.index] == 2 * pi) {
              orientation[widget.index] = 0;
            }
            ref
                .read(orientationProvider.notifier)
                .update((state) => orientation);
          },
        ),
        Text(
          widget.text ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'JosefinSans',
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
        InkWell(
          radius: 50,
          onTap: () {
            setState(() {
              _isMarked = !_isMarked;
              widget.onChecked!(_isMarked);
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
    );
  }
}
