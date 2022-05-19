import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_meme/view/resources/assets_manager.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/dark_theme_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/styles_manager.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _passwordFocusNode = FocusNode();
  String _emailAddress = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAppLanguage();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(AppSize.s12),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(LocaleKeys.login,
                        style: Theme.of(context).textTheme.headline1)
                    .tr(),
              ),
            ),
            Flexible(
                flex: 5,
                child: Form(
                    //To your key
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            key: const ValueKey('email'),
                            validator: (value) =>ValidDator.validatorEmail(value!)
                                  ? null
                                  : LocaleKeys.invalidEmail.tr()
                            ,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.emailHint.tr(),
                            ),
                            onSaved: (value) {
                              _emailAddress = value!;
                            },
                          ),
                        ),
                        SizedBox(height: AppSizeHeight.h2,),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            key: const ValueKey('Password'),
                            validator: (value) =>
                                ValidDator.validatorPassword(value!)
                                    ? null
                                    : LocaleKeys.passwordError.tr(),
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _passwordFocusNode,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.password.tr(),
                            ),
                            onSaved: (value) {
                              _password = value!;
                            },
                            onEditingComplete: _submitForm,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 10),
                            Text(LocaleKeys.forgetPassword,
                                    style:
                                        Theme.of(context).textTheme.subtitle1)
                                .tr(),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(
                          height: AppSizeHeight.h4,
                        ),
                        MaterialButton(
                            elevation: 3,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 3),
                            color: ColorManager.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              LocaleKeys.login,
                              style: Theme.of(context).textTheme.subtitle2,
                            ).tr(),
                            onPressed: () {
                              _submitForm();
                            })
                      ],
                    ))),
            Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Or sign up with social account',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: AppSizeHeight.h2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                themeChange.darkTheme = false;
                              });
                            },
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: Image(
                              image: const AssetImage(ImageAssets.iconGoogle),
                              width: AppSizeWidth.w8,
                              height: AppSizeHeight.h8,
                            ),
                          ),
                          SizedBox(
                            width: AppSizeWidth.w8,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: Image(
                              image: const AssetImage(ImageAssets.iconFacebook),
                              width: AppSizeWidth.w8,
                              height: AppSizeHeight.h8,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSizeHeight.h2,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
