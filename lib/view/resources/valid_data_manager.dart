import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class ValidDator {
  static bool checkEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool checkPassword(String value) {
    if (value.isEmpty || value.length < 7) {
      return false;
    }
    return true;
  }

  static String? validatorEmail(String? value) =>
      ValidDator.checkEmail(value!) ? null : LocaleKeys.invalidEmail.tr();
}
