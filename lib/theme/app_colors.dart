import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color black = HexColor.fromHex('#000000');
  static final Color primaryDefault = HexColor.fromHex('#B9C6EE');
  static final Color lightPink = HexColor.fromHex('#EAB5D0');
  static final Color lightOrange = HexColor.fromHex('#F6CDB6');
  static final Color lightYellow = HexColor.fromHex('#F6DCB6');
  static final Color lightBlue = HexColor.fromHex('#B8DDE6');
  static final Color purple = HexColor.fromHex('#5F62A9');
  static final Color pink = HexColor.fromHex('#E43A8A');
  static final Color orange = HexColor.fromHex('#F96C1C');
  static final Color yellow = HexColor.fromHex('#F9B21C');
  static final Color blue = HexColor.fromHex('#07A7CB');
  static final Color darkPurple = HexColor.fromHex('#36387B');
  static final Color darkPink = HexColor.fromHex('#98245B');
  static final Color darkYellow = HexColor.fromHex('#946502');
  static final Color white = HexColor.fromHex('#FFFFFF');
  static final Color darkOrange = HexColor.fromHex('#942E02');
  static final Color darkBlue = HexColor.fromHex('#02677E');
  static final Color veryLightPurple = HexColor.fromHex('#DDE5FE');
  static final Color lightPurple = HexColor.fromHex('#5F62A9');

  static final Color shadowColor = HexColor.fromHex('#656B8E');

  static const SweepGradient secondaryGradient = SweepGradient(
    startAngle: 2.9,
    endAngle: 6.8,
    colors: [
      Color(0xFFF57376),
      Color(0xFF41B8D2),
      Color(0xFF41B8D2),
      Color(0xFFF57376),
    ],
    tileMode: TileMode.clamp,
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    var tmpHexColorString = hexColorString.replaceAll('#', '');
    if (tmpHexColorString.length == 6) {
      tmpHexColorString = '0xFF$tmpHexColorString';
    } else {
      tmpHexColorString = '0x$tmpHexColorString';
    }
    return Color(int.parse(tmpHexColorString));
  }
}
