import 'package:flutter/material.dart';
import 'package:shop_meme/view/add_shipping_address/add_shipping_address.dart';
import 'package:shop_meme/view/bag/bag.dart';
import 'package:shop_meme/view/cart/cart.dart';
import 'package:shop_meme/view/categories/categories.dart';
import 'package:shop_meme/view/favorite/favorite.dart';
import 'package:shop_meme/view/forgot_password/forgot_password.dart';
import 'package:shop_meme/view/home/home.dart';
import 'package:shop_meme/view/login/login.dart';
import 'package:shop_meme/view/order_history/order_history.dart';
import 'package:shop_meme/view/order_history_detail/order_history_detail.dart';
import 'package:shop_meme/view/payment/payment.dart';
import 'package:shop_meme/view/product_detail/product_detail.dart';
import 'package:shop_meme/view/profile/profile.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_meme/view/setting_information/setting_information.dart';
import 'package:shop_meme/view/shipping_address/shipping_address.dart';
import 'package:shop_meme/view/sign_up/sign_up.dart';
import 'package:shop_meme/view/widget/bottom_bar.dart';

class Routes {
  static const String bottomBarRoute = "/bottomBar";
  static const String addShippingAddressRoute = "/addShippingAddress";
  static const String bagRoute = "/bag";
  static const String cartRoute = "/cart";
  static const String categoriesRoute = "/categories";
  static const String favoriteRoute = "/favorite";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String orderHistoryRoute = "/orderHistory";
  static const String orderHistoryDetailRoute = "/orderHistoryDetail";
  static const String paymentRoute = "/payment";
  static const String productDetailRoute = "/productDetail";
  static const String profileRoute = "/profile";
  static const String settingInformationRoute = "/settingInformation";
  static const String shippingAddressRoute = "/shippingAddress";
  static const String signUpRoute = "/signUp";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.bottomBarRoute:
        return MaterialPageRoute(builder: (_) => BottomBarScreen());
      case Routes.addShippingAddressRoute:
        return MaterialPageRoute(builder: (_) => AddShippingAddress());
      case Routes.bagRoute:
        return MaterialPageRoute(builder: (_) => Bag());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => Cart());
      case Routes.categoriesRoute:
        return MaterialPageRoute(builder: (_) => Categories());
      case Routes.favoriteRoute:
        return MaterialPageRoute(builder: (_) => Favorite());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.orderHistoryRoute:
        return MaterialPageRoute(builder: (_) => OrderHistory());
      case Routes.orderHistoryDetailRoute:
        return MaterialPageRoute(builder: (_) => OrderHistoryDetail());
      case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => Payment());
      case Routes.productDetailRoute:
        return MaterialPageRoute(builder: (_) => ProductDetail());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
      case Routes.settingInformationRoute:
        return MaterialPageRoute(builder: (_) => SettingInformation());
      case Routes.shippingAddressRoute:
        return MaterialPageRoute(builder: (_) => ShippingAddress());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(LocaleKeys.noRouteFound).tr(),
              ),
              body: Center(child: const Text(LocaleKeys.noRouteFound).tr()),
            ));
  }
}
