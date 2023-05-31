// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skola/theme/app_colors.dart';

import '../../widgets/big_pink_button.dart';
import '../../widgets/settings_icon.dart';

class TemplateScreen extends StatelessWidget {
  final String headlineText;
  final String subtitleText;
  final String buttonText;
  final String birdUrlPath;
  final Icon iconImage;
  final VoidCallback? onTap;
  const TemplateScreen({
    super.key,
    required this.headlineText,
    required this.subtitleText,
    required this.buttonText,
    required this.birdUrlPath,
    required this.iconImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.veryLightPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SvgPicture.asset(
                    'Assets/images/Logo.svg',
                  ),
                ),
                SvgPicture.asset('Assets/images/branch.svg'),
              ],
            ),
            Column(
              children: [
                Text(
                  headlineText,
                  style: TextStyle(fontSize: 90, color: AppColors.purple),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  subtitleText,
                  style: TextStyle(fontSize: 30, color: AppColors.purple),
                ),
                SizedBox(
                  height: 55,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: BigPinkButton(
                    buttonText: buttonText,
                    iconImage: iconImage,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      birdUrlPath,
                      width: 840,
                      height: 300,
                    ),
                    SettingsIcon(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
