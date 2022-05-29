import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/font_manager.dart';
import 'package:shop_meme/view/resources/styles_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        dividerColor: isDarkTheme ? Colors.white : ColorManager.grey,
        scaffoldBackgroundColor: isDarkTheme
            ? ColorManager.darkPrimary
            : ColorManager.whiteBackground,
        primaryColor:
            isDarkTheme ? ColorManager.darkPrimary : ColorManager.primary,
        unselectedWidgetColor:
            isDarkTheme ? ColorManager.whiteBackground : ColorManager.black,
        backgroundColor:
            isDarkTheme ? Colors.grey.shade700 : ColorManager.whiteBackground,
        indicatorColor:
            isDarkTheme ? const Color(0xff0E1D36) : ColorManager.white,
        hintColor: isDarkTheme ? Colors.grey.shade300 : ColorManager.grey,
        hoverColor: isDarkTheme ? const Color(0xff3A3A3B) : ColorManager.black,
        focusColor: isDarkTheme ? const Color(0xff0B2512) : ColorManager.black,
        disabledColor: ColorManager.grey,
        //ProductCard
        cardColor: isDarkTheme ? ColorManager.darkCard : ColorManager.white,
        canvasColor: isDarkTheme ? Colors.red : ColorManager.primary,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
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
        appBarTheme: AppBarTheme(
          iconTheme: isDarkTheme
              ? const IconThemeData(color: Colors.black)
              : IconThemeData(color: ColorManager.black),
          backgroundColor: isDarkTheme
              ? ColorManager.whiteBackground
              : ColorManager.whiteBackground,
          elevation: 0,
          titleTextStyle:
              TextStyle(color: isDarkTheme ? Colors.white : ColorManager.black),
        ),
        // Text theme
        textTheme: TextTheme(
            headline1:
                getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s26),
            headline2:
                getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s22),
            //Product home name
            headline3:
                getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
            //Price
            headline4:
                getSemiBoldStyle(color: ColorManager.red, fontSize: FontSize.s14),
            //Discount price
            headline5: getSemiBoldStyle(
                color: ColorManager.whiteBackground, fontSize: FontSize.s12),
            subtitle1:
                getMediumStyle(color: ColorManager.black, fontSize: FontSize.s12),
                //Discount prie
            subtitle2:
                getMediumStyle(color: ColorManager.white, fontSize: FontSize.s14),
                //Title modelBottomSheet
                headline6:  getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
            //Description pricez

            // bodyText1: getMediumStyle(color: ColorManager.green),
            // caption: getRegularStyle(color: ColorManager.grey1),
            bodyText2: getRegularStyle(color: ColorManager.grey)),
        // input decoration theme (text form field)

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppSize.s8),
          hoverColor: ColorManager.white,
          // hint style
          hintStyle:
              getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
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
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          ),
          // focused error border
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          ),
        ),

        textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : ColorManager.black,
          selectionHandleColor:
              isDarkTheme ? ColorManager.whiteBackground : ColorManager.black,
        ));
  }
}
