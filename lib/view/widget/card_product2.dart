import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/product.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';

class CardProduct2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<Product>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorManager.grey)
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                   color: ColorManager.whiteCard,
              ),
            
              padding: EdgeInsets.all(AppSizeWidth.w6),
              child: Image(
                image: NetworkImage(productModel.imageUrl),
                fit: BoxFit.fill,
                width: AppSizeWidth.w25,
                height: AppSizeWidth.w25,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ValidDator.convertProductName(
                      length: 40, nameProduct: productModel.title),
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  //*TODO here add poit
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
