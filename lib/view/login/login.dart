import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/view/resources/assets_manager.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/dark_theme_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/button_primary.dart';

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
      appBar: AppBar(
       leading:  Icon(Icons.arrow_back_ios_new,),

      ),
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
                        TextFieldData(
                            valueKey: 'email',
                            validator: ValidDator.validatorEmail,
                            strForcusNode: _passwordFocusNode,
                            labelText: LocaleKeys.emailHint.tr(),
                            getValue: (value) {
                              _emailAddress = value;
                            }),
                        SizedBox(
                          height: AppSizeHeight.h2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            key: const ValueKey('Password'),
                            validator: (value) =>
                                ValidDator.checkPassword(value!)
                                    ? null
                                    : LocaleKeys.passwordError.tr(),
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _passwordFocusNode,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.password.tr(),
                            ),
                            onSaved: (value) {
                              _password = value!;
                            },
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
                            const SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(
                          height: AppSizeHeight.h4,
                        ),
                        ButtonPrimary(
                            label: LocaleKeys.login, onPressed: _submitForm)
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
                        LocaleKeys.signupWithSocialAccount.tr(),
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

class TextFieldData extends StatelessWidget {
  final String valueKey;
  // final Function(String value) validator;
  final String? Function(String?)? validator;
  final FocusNode strForcusNode;
  final String labelText;
  final Function(String value) getValue;
  const TextFieldData({
    Key? key,
    required this.valueKey,
    required this.validator,
    required this.strForcusNode,
    required this.labelText,
    required this.getValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
          key: ValueKey(valueKey),
          validator: validator,
          textInputAction: TextInputAction.next,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(strForcusNode),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: labelText,
          ),
          onSaved: (d) => getValue(d!)),
    );
  }
}
