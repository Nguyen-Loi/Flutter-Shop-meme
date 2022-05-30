import 'package:shared_preferences/shared_preferences.dart';

class SettingPrefences {
  static const STATUS_DISPLAY_PRODUCT = 'STATUS_DISPLAY';

  setTypeProduct(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(STATUS_DISPLAY_PRODUCT, value);
  }

   getTypeProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(STATUS_DISPLAY_PRODUCT)??false;
  }
}
