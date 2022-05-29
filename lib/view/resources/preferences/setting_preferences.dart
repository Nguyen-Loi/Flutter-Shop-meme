import 'package:shared_preferences/shared_preferences.dart';

class SettingPrefences {
  static const STATUS_DISPLAY_PRODUCT = 'STATUS_DISPLAY';

  setTypeProduct(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('123', value);
  }

  Future  getTypeProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('123');
  }
}
