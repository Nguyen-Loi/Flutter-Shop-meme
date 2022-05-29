import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/l10n.dart';
import 'package:shop_meme/model/product_provider.dart';
import 'package:shop_meme/view/favorite/favorite.dart';
import 'package:shop_meme/view/forgot_password/forgot_password.dart';
import 'package:shop_meme/view/home/home.dart';
import 'package:shop_meme/view/login/login.dart';
import 'package:shop_meme/view/provider/dark_theme_provider.dart';
import 'package:shop_meme/view/provider/setting_provider.dart';
import 'package:shop_meme/view/resources/routes_manager.dart';
import 'package:shop_meme/view/resources/theme_manager.dart';
import 'package:shop_meme/view/widget/bottom_bar.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/translations',
    fallbackLocale: L10n.all[0],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  SettingProvider _statusOptionProduct = SettingProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  void getCurrentTypeProduct() async {
    _statusOptionProduct.typeProduct =
        await _statusOptionProduct.settingPrefences.getTypeProduct();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    getCurrentTypeProduct();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => themeChangeProvider),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => SettingProvider()),
          ],
          child:
              Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
            return MaterialApp(
              onGenerateRoute: RouteGenerator.getRoute,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              locale: context.locale,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              home: Favorite(),
            );
          }));
    });
  }
}
