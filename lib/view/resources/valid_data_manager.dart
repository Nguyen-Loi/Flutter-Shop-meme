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

  static String? validatorPassword(String? value) =>
      ValidDator.checkPassword(value!) ? null : LocaleKeys.passwordError.tr();

  static String? validatorPasswordMatch(String? value, String? value2) =>
      value == value2 ? null : LocaleKeys.confirmPasswordInvalid.tr();

  static String convertProductName(
          {required int length, required String nameProduct}) =>
      nameProduct.length > length
          ? nameProduct.substring(0, length) + '...'
          : nameProduct;

  static String caculateDiscount(
      {required double price, required int discount}) {
    if (discount != 0) {
      int temp =  100-discount;
      return (price * (temp/100)).toString();
    }
    return price.toString();
  }
}
