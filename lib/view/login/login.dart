import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/strings_manager.dart';
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
  bool _obscureText = true;
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

  void _changeLanguage() {
    // i will apply localisation later
    // setLanguageChanged();
    Phoenix.rebirth(context); // restart to apply language changes
  }

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      //todo Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => BottomViewScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                child: MaterialButton(
                  onPressed: (){
                     
                     context.locale = Locale("vn");
                       Phoenix.rebirth(context); 
                  },
                  child: Text('Viet name', style: TextStyle(
                    fontSize: 28, 
                    fontWeight: FontWeight.bold
                  )
                  ).tr(),
                ),),
                Container(
            child: MaterialButton(
              onPressed: (){
                 context.locale = Locale("en");
                   Phoenix.rebirth(context); 
              },
              child: Text('Enlgish', style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold
              )
              ).tr(),
            ),)
            ],
          ),
          Container(
            child: Text(LocaleKeys.appTitle, style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.bold
            )
            ).tr(),)
            
        ],
      ),
      
    );
  }
}
