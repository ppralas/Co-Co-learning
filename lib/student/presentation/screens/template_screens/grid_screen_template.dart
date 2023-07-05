import 'package:flutter/material.dart';

class GridScreenTemplate extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  final Widget widget4;
  final Widget? widget5;
  const GridScreenTemplate({
    super.key,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.widget4,
    this.widget5,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: widget1,
                ),
                Expanded(
                  child: widget2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: widget3,
                ),
                Expanded(
                  child: widget4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
