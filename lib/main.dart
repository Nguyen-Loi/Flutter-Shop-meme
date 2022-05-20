import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/l10n.dart';
import 'package:shop_meme/view/login/login.dart';
import 'package:shop_meme/view/resources/dark_theme_provider.dart';
import 'package:shop_meme/view/resources/theme_manager.dart';
import 'package:shop_meme/view/sign_up/sign_up.dart';
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

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) {
              return themeChangeProvider;
            })
          ],
          child:
              Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              locale: context.locale,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              home: SignUp(),
            );
          }));
    });
  }
}
