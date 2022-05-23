import 'package:flutter/material.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class TitleDescHome extends StatelessWidget {
  final String title;
  final String desTitle;
  final Function() onPressViewAll;
  const TitleDescHome({
    Key? key,
    required this.title,
    required this.desTitle,
    required this.onPressViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( left: AppSize.s12, right: AppSize.s12 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.start,
              ).tr(),
              Spacer(),
              GestureDetector(
                onTap: onPressViewAll,
                child: Text(
                  LocaleKeys.viewAll,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.end,
                ).tr(),
              ),
            ],
          ),
          Text(
            desTitle,
          ).tr(),
        ],
      ),
    );
  }
}
