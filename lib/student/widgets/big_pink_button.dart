import 'package:flutter/material.dart';
import 'package:skola/theme/app_colors.dart';

class BigPinkButton extends StatelessWidget {
  final String buttonText;
  final Icon iconImage;
  const BigPinkButton({
    super.key,
    required this.buttonText,
    required this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 500,
      decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkPink,
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(6, 8),
            )
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            iconImage,
          ],
        ),
      ),
    );
  }
}
