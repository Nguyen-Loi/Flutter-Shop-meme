import 'package:intl/intl.dart';

extension FormatCurrencyEx on dynamic {
  String toVND({String? unit = 'đ'}) {
    double number = double.parse(this.toString());
    var vietNamFormatCurrency =
        NumberFormat.currency(locale: "vi-VN", symbol: unit);
    return vietNamFormatCurrency.format(number).toString();
  }
}