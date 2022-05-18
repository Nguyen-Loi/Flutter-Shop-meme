import 'package:flutter/material.dart';

class ColorManager {
  //Light mode
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color scaffoldBackground = HexColor.fromHex("#F9F9F9");
  static Color backgound = HexColor.fromHex("#FFFFFF");
  static Color button = HexColor.fromHex("#DB3022");
  static Color hint = HexColor.fromHex("#DB3022");
  static Color highlight = HexColor.fromHex("#DB3022");
  static Color hover = HexColor.fromHex("#DB3022");
  static Color focus = HexColor.fromHex("#DB3022");
  static Color disable = HexColor.fromHex("#DB3022");
  static Color textSelection = HexColor.fromHex("#DB3022");
  static Color card = HexColor.fromHex("#DB3022");
  static Color canvas = HexColor.fromHex("#DB3022");
  static Color brightness = HexColor.fromHex("#DB3022");
  static Color accent = HexColor.fromHex("#DB3022");
  static Color primarySwatch = HexColor.fromHex("#DB3022");
  static Color indicator = HexColor.fromHex("#DB3022");

  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000"); // red color
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
