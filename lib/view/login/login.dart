import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/view/provider/dark_theme_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/resable_function.dart';
import 'package:shop_meme/view/resources/routes_manager.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/button_primary.dart';
import '../widget/signIn_social.dart';

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
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(Routes.signUpRoute),
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.s12),
        child: Column(
          children: <Widget>[
            //1
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(LocaleKeys.login,
                        style: Theme.of(context).textTheme.headline1)
                    .tr(),
              ),
            ),
            //2
            Flexible(
                flex: 5,
                child: Form(
                    //To your key
                    key: _formKey,
                    child: Column(
                      children: [
                        //*zEmail
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                              key: const ValueKey('Email'),
                              validator: ValidDator.validatorEmail,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.emailHint.tr(),
                              ),
                              onSaved: (d) => _emailAddress = d!),
                        ),
                        SizedBox(
                          height: AppSizeHeight.h2,
                        ),
                        //*zPassword
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                              key: const ValueKey('Password'),
                              validator: ValidDator.validatorPassword,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: _passwordFocusNode,
                              obscureText: true,
                              decoration:  InputDecoration(
                                  labelText: LocaleKeys.password.tr()),
                              onSaved: (d) => _password = d!),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.forgotPasswordRoute),
                          child: Row(
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
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizeHeight.h4,
                        ),
                        ButtonPrimary(
                            label: LocaleKeys.login.tr(),
                            onPressed: () => ResableFuntions.submitForm(
                                ctx: context,
                                fKey: _formKey,
                                function: () => Navigator.of(context)
                                    .pushReplacementNamed(
                                        Routes.bottomBarRoute)))
                      ],
                    ))),
            Flexible(
                flex: 3,
                child: SignInSocialBottom(
                    onPressedGoogle: () {
                       context.locale = Locale('en');
                        Phoenix.rebirth(context);
                    }, onPressedFacebook: () {
                       context.locale = Locale('vi');
                        Phoenix.rebirth(context);
                    })),
          ],
        ),
      ),
    );
  }
}
