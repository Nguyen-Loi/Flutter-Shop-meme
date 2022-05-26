import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/app/enum_option.dart';
import 'package:shop_meme/model/product_provider.dart';
import 'package:shop_meme/view/provider/setting_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_meme/view/resources/preferences/setting_preferences.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/card_product.dart';
import 'package:shop_meme/view/widget/card_product2.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final _statusOptionProduct =
        Provider.of<SettingProvider>(context);
    //
    final productsData = Provider.of<ProductProvider>(context).getProduct;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.favorite,
          style: Theme.of(context).textTheme.headline2,
        ).tr(),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.s12),
            child: Icon(
              Icons.search,
              color: Theme.of(context).textSelectionHandleColor,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          //* Filter
          Container(
            padding: EdgeInsets.all(AppSize.s12),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ]),
            child: Row(
              children: [
                //*Fliter 1
                Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: Theme.of(context).textSelectionHandleColor,
                        ),
                        Text(
                          '  ' + LocaleKeys.filters.tr(),
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )),
                //*Filter 2
                Flexible(
                    flex: 4,
                    child: Row(
                      children: [
                        Icon(Icons.swap_vert,
                            color: Theme.of(context).textSelectionHandleColor),
                        Text(
                          '  ' + LocaleKeys.filterPriceLowestToHigh.tr(),
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )),
                //*Filter 3
                Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        _statusOptionProduct.setStatusOptionProduct =
                            !_statusOptionProduct.getStatusOptionProduct;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _statusOptionProduct.getStatusOptionProduct
                              ? Icon(Icons.view_list,
                                  color: Theme.of(context)
                                      .textSelectionHandleColor)
                              : Icon(Icons.view_module,
                                  color: Theme.of(context)
                                      .textSelectionHandleColor),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          //*FetchData
         _statusOptionProduct.getStatusOptionProduct? Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSize.s12),
              child: GridView.builder(
                itemCount: productsData.length,
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: productsData[index],
                    child: CardProduct(
                      typeProduct: TypeLogoProduct.hot,
                      titleLength: 26,
                    ),
                  );
                },
              ),
            ),
          )
       :Expanded(
         child: ListView.builder(
                      itemCount: productsData.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: productsData[index],
                            child: CardProduct2(),
                            );
                      }),
       ) ],
      ),
    );
  }
}
