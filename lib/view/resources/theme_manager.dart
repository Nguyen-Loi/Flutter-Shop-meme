import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/color_manager.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black :ColorManager.scaffoldBackground,  
      primaryColor: isDarkTheme ? Colors.black : ColorManager.primary,
      backgroundColor: isDarkTheme ? Colors.grey.shade700 : ColorManager.backgound,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : ColorManager.indicator,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : ColorManager.button,
      hintColor: isDarkTheme ? Colors.grey.shade300 : ColorManager.hint,
      highlightColor: isDarkTheme ? Color(0xff372901) : ColorManager.highlight,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : ColorManager.hover,
      focusColor: isDarkTheme ? Color(0xff0B2512) : ColorManager.focus,
      disabledColor: ColorManager.disable,
      textSelectionColor: isDarkTheme ? Colors.white : ColorManager.textSelection,
      cardColor: isDarkTheme ? Color(0xFF151515) : ColorManager.card,
      canvasColor: isDarkTheme ? Colors.black : ColorManager.canvas,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),

            accentColor: ColorManager.accent,
              primarySwatch: Colors.purple,
    );
  }
}