import 'package:flutter/widgets.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/preferences/setting_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingProvider with ChangeNotifier {
  SettingPrefences settingPrefences = SettingPrefences();
  bool _typeProduct = true;

  bool get typeProduct => _typeProduct;

  set typeProduct(bool newTypeProduct) {
    _typeProduct = newTypeProduct;
    settingPrefences.setTypeProduct(newTypeProduct);
    notifyListeners();
  }

  toggleTypeProduct() {
    _typeProduct = !_typeProduct;
    settingPrefences.setTypeProduct(_typeProduct);
    notifyListeners();
  }

   Future<bool> get loadTypeProduct async {
    _typeProduct = await settingPrefences.getTypeProduct();
    notifyListeners();
    return _typeProduct;
  }

  //Handle filter
  String _selectedFilter = LocaleKeys.filterPopular.tr();

  String get selectedFilter => _selectedFilter;

  setSelectedFilter(String newOptionFilter) {
    _selectedFilter = newOptionFilter;
    notifyListeners();
  }
}
