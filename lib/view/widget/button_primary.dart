import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const ButtonPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppSizeHeight.h6,
      child: MaterialButton(
          elevation: 3,
          color: ColorManager.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onPressed: onPressed),
    );
  }
}
