import 'package:flutter/material.dart';

class ColorManager {
  static Color black = HexColor.fromHex("#222222");
  static Color primary = HexColor.fromHex("#DB3022");
  static Color whiteBackground = HexColor.fromHex("#F9F9F9");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color grey = HexColor.fromHex("#9B9B9B");
  static Color red = HexColor.fromHex("#F01F0E");
  static Color green = HexColor.fromHex("#2AA952");
  static Color whiteCard = HexColor.fromHex("#E4E4E4");
  static Color darkCard = HexColor.fromHex("#2A2C36");

  //Widget
  static Color yellow = Colors.yellow;

  // new colors
  static Color darkPrimary = HexColor.fromHex("#1E1F28");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  // static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  // static Color black= HexColor.fromHex("#000000"); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
