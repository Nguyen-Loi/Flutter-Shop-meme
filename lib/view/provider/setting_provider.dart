import 'package:flutter/widgets.dart';
import 'package:shop_meme/view/resources/preferences/setting_preferences.dart';

class SettingProvider with ChangeNotifier {
  SettingPrefences settingPrefences = SettingPrefences();
  bool _option = false;

  bool get getStatusOptionProduct => _option;

  set setStatusOptionProduct(bool value) {
    _option = value;
    settingPrefences.setStatusDisplayProduct(value);
    notifyListeners();
  }
}
