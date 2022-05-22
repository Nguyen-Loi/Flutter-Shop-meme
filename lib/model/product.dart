import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/widgets.dart';

class Product with ChangeNotifier{
  String id;
  double price;
  String title;
  String imageUrl;
  String description;
  int discountPrice;
   bool? isFavorite;
  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.discountPrice,
    this.isFavorite,
  });
}
