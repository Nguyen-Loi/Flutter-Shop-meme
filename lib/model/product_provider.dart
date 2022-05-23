import 'package:flutter/cupertino.dart';
import 'package:shop_meme/model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
        id: '1',
        price: 8230000,
        title: 'Samsung Galaxy S9',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
        description:
            'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
        discountPrice: 30),
    Product(
        id: '2',
        price: 3400000,
        title: 'Samsung Galaxy A10s',
        isFavorite: true,
        numberRating: 4,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg',
        discountPrice: 0,
        description:
            'Samsung Galaxy A10s A107M - 32GB, 6.2" HD+ Infinity-V Display, 13MP+2MP Dual Rear +8MP Front Cameras, GSM Unlocked Smartphone - Blue.'),
    Product(
      id: '3',
      price: 1320000,
      title: 'Samsung Galaxy A51',
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
      description:
          'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
      discountPrice: 0,
    ),
    Product(
        id: '4',
        price: 5200000,
        title: 'Samsung Galaxy S9',
        isFavorite: true,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
        description:
            'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
        discountPrice: 0),
    Product(
        id: '5',
        price: 12000000,
        title: 'Huawei P40 Pro',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/6186cnZIdoL._AC_SL1000_.jpg',
        description:
            'Huawei P40 Pro (5G) ELS-NX9 Dual/Hybrid-SIM 256GB (GSM Only | No CDMA) Factory Unlocked Smartphone (Silver Frost) - International Version',
        discountPrice: 10),
    Product(
        id: '6',
        price: 13499000,
        title: 'iPhone 12 Pro',
        numberRating: 5,
        isFavorite: true,
        imageUrl:
            'https://m.media-amazon.com/images/I/71cSV-RTBSL.jpg',
        description:
            'New Apple iPhone 12 Pro (512GB, Gold) [Locked] + Carrier Subscription',
        discountPrice: 15),
    Product(
        id: '7',
        price: 15000000,
        title: 'iPhone 12 Pro Max',
        numberRating: 1,
        imageUrl:
            'https://m.media-amazon.com/images/I/71XXJC7V8tL._FMwebp__.jpg',
        description:
            'New Apple iPhone 12 Pro Max (128GB, Graphite) [Locked] + Carrier Subscription',
        discountPrice: 20),
  ];

  List<Product> get getProduct {
    return [..._products];
  }
}
