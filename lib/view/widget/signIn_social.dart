import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/assets_manager.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class SignInSocialBottom extends StatelessWidget {
  final Function() onPressedGoogle;
  final Function() onPressedFacebook;
  const SignInSocialBottom({
    Key? key,
    required this.onPressedGoogle,
    required this.onPressedFacebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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
                onPressed: onPressedGoogle,
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Image(
                  image:AssetImage(ImageAssets.iconGoogle),
                  width: AppSizeWidth.w8,
                  height: AppSizeHeight.h8,
                ),
              ),
              SizedBox(
                width: AppSizeWidth.w8,
              ),
              MaterialButton(
                onPressed: onPressedFacebook,
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
    );
  }
}
