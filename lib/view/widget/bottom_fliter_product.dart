import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/values_manager.dart';

class BottomFilterByProduct extends StatelessWidget {
  final String? textSelected;
  BottomFilterByProduct({
    Key? key,
    this.textSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppSize.s12, bottom: AppSize.s12),
      height: MediaQuery.of(context).size.height / 2 - 10,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(LocaleKeys.sortBy.tr(),
              style: Theme.of(context).textTheme.headline3),
          //*Popular
          FilterItem(
              title: LocaleKeys.filterPopular,
              onPressed: () {
                Navigator.pop(context, LocaleKeys.filterPopular.tr());
              },
              //*Newest
              titleCheck: textSelected!),
          FilterItem(
              title: LocaleKeys.filterNewest,
              onPressed: () {
                Navigator.pop(context, LocaleKeys.filterNewest.tr());
              },
              //*Customer review
              titleCheck: textSelected!),
          FilterItem(
              title: LocaleKeys.filterCustomerReview,
              onPressed: () {
                Navigator.pop(context, LocaleKeys.filterCustomerReview.tr());
              },
              //*Lowest to high
              titleCheck: textSelected!),
          FilterItem(
              title: LocaleKeys.filterPriceLowestToHigh,
              onPressed: () {
                Navigator.pop(context, LocaleKeys.filterPriceLowestToHigh.tr());
              },
              titleCheck: textSelected!),
          //*Highest to low
          FilterItem(
              title: LocaleKeys.filterPriceHightestToLow,
              onPressed: () {
                Navigator.pop(context, LocaleKeys.filterPriceHightestToLow.tr());
              },
              titleCheck: textSelected!)
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final String titleCheck;
  const FilterItem(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.titleCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: title == titleCheck
            ? ColorManager.primary
            : Theme.of(context).cardColor,
        margin: EdgeInsets.symmetric(vertical: AppSize.s3),
        height: 40,
        child: TextButton(
            onPressed: onPressed,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('   ' + title.tr(),
                    style: Theme.of(context).textTheme.subtitle2))));
  }
}
