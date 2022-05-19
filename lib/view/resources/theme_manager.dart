import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/font_manager.dart';
import 'package:shop_meme/view/resources/styles_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : ColorManager.whiteBackground,
      primaryColor: isDarkTheme ? Colors.black : ColorManager.primary,
      backgroundColor:
      isDarkTheme ? Colors.grey.shade700 : ColorManager.whiteBackground,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : ColorManager.white,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : ColorManager.primary,
      hintColor: isDarkTheme ? Colors.grey.shade300 : ColorManager.grey,
      highlightColor: isDarkTheme ? Color(0xff372901) : ColorManager.green,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : ColorManager.black,
      focusColor: isDarkTheme ? Color(0xff0B2512) : ColorManager.black,
      disabledColor: ColorManager.grey,
      textSelectionColor:
          isDarkTheme ? Colors.white : ColorManager.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : ColorManager.white,
      canvasColor: isDarkTheme ? Colors.red : ColorManager.primary,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      accentColor: ColorManager.primary,

       cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // Button theme

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s26),
          // headline2: getRegularStyle(
          //     color: ColorManager.white, fontSize: FontSize.s16),
          // headline3:
          //     getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
          // headline4: getRegularStyle(
          //     color: ColorManager.primary, fontSize: FontSize.s14),
          subtitle1: getMediumStyle(
              color: ColorManager.black, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(
              color: ColorManager.white, fontSize: FontSize.s14),
          // bodyText1: getMediumStyle(color: ColorManager.green),
          // caption: getRegularStyle(color: ColorManager.grey1),
          bodyText2: getRegularStyle(color: ColorManager.grey)),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppSize.s8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        // label style
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).cardColor,

        labelStyle: getMediumStyle(color: ColorManager.grey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.red),
        
        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            ),
      )

    
    );
  }
}
