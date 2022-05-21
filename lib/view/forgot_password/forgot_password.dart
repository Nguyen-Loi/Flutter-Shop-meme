import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/resable_function.dart';
import 'package:shop_meme/view/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/button_primary.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FocusNode _emailFocusNode = FocusNode();
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(LocaleKeys.forgetPassword,
                        style: Theme.of(context).textTheme.headline2)
                    .tr(),
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    LocaleKeys.linkToEmail,
                    style: Theme.of(context).textTheme.subtitle1,
                  ).tr(),
                  SizedBox(
                    height: AppSizeHeight.h2,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                          key: const ValueKey('Email'),
                          validator: ValidDator.validatorEmail,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => () {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.emailHint.tr(),
                          ),
                          onSaved: (d) => _email = d!),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 6,
                child: ButtonPrimary(
                    label: LocaleKeys.send,
                    onPressed: () => ResableFuntions.submitForm(
                        fKey: _formKey, ctx: context))),
          ],
        ),
      ),
    );
  }
}
