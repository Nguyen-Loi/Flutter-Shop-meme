import 'package:flutter/material.dart';

class ResableFuntions {
  //Check form textField
  static void submitForm(
      {required GlobalKey<FormState> fKey,
      required BuildContext ctx,
      Function()? function =null}) {
    final isValid = fKey.currentState!.validate();
    FocusScope.of(ctx).unfocus();
    if (isValid) {
      fKey.currentState!.save();
     function!();
    }
     
  }
}
