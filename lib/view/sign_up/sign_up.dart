import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/view/resources/assets_manager.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/dark_theme_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/resable_function.dart';
import 'package:shop_meme/view/resources/routes_manager.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/button_primary.dart';
import '../widget/signIn_social.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  String _emailAddress = '';
  String _password = '';
  final String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
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
              Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
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
                child: Text(LocaleKeys.register,
                        style: Theme.of(context).textTheme.headline1)
                    .tr(),
              ),
            ),
            //2
            Flexible(
                flex: 6,
                child: Form(
                    //To your key
                    key: _formKey,
                    child: Column(
                      children: [
                        //*Email
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: TextFormField(
                                    key: const ValueKey('Email'),
                                    validator: ValidDator.validatorEmail,
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () =>
                                        FocusScope.of(context)
                                            .requestFocus(_passwordFocusNode),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: LocaleKeys.emailHint.tr(),
                                    ),
                                    onSaved: (d) => _emailAddress = d!),
                              ),
                              SizedBox(
                                height: AppSizeHeight.h1,
                              ),
                              //*Password
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: TextFormField(
                                    key: const ValueKey('Password'),
                                    focusNode: _passwordFocusNode,
                                    validator: ValidDator.validatorPassword,
                                    keyboardType: TextInputType.emailAddress,
                                    onEditingComplete: () =>
                                        FocusScope.of(context).requestFocus(
                                            _confirmPasswordFocusNode),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: LocaleKeys.password.tr()),
                                    onSaved: (d) => _password = d!),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizeHeight.h1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                              key: const ValueKey('ConfirmPassword'),
                              validator: (d) =>
                                  ValidDator.validatorPasswordMatch(
                                      _confirmPassword, d),
                              keyboardType: TextInputType.emailAddress,
                              focusNode: _confirmPasswordFocusNode,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: LocaleKeys.confirmPassword.tr()),
                              onSaved: (d) => _confirmPassword),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.loginRoute),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(width: 10),
                              Text(LocaleKeys.haveAccount,
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
                            label: LocaleKeys.register.tr(),
                            onPressed: () => ResableFuntions.submitForm(
                                fKey: _formKey, ctx: context))
                      ],
                    ))),
            Flexible(
                flex: 2,
                child: SignInSocialBottom(
                    onPressedGoogle: () {}, onPressedFacebook: () {})),
          ],
        ),
      ),
    );
  }
}
