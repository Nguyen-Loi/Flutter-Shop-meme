import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/product.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/app/extension.dart';

class CardProduct2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<Product>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.grey, width: 0.005)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorManager.whiteCard,
                  ),
                  padding: EdgeInsets.all(AppSizeWidth.w4),
                  child: Image(
                    image: NetworkImage(productModel.imageUrl),
                    fit: BoxFit.fill,
                    width: AppSizeWidth.w16,
                    height: AppSizeWidth.w20,
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
                    SizedBox(height: AppSizeHeight.h2,),
                    Row(
                      children: [
                        Text(
                            ValidDator.caculateDiscount(
                                    price: productModel.price,
                                    discount: productModel.discountPrice)
                                .toVND(),
                            style: Theme.of(context).textTheme.headline4),
                        //Condition discount ==0
                        SizedBox(
                          width: 4,
                        ),
                        productModel.discountPrice != 0
                            ? Text(
                                productModel.price.toVND(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox(),
                      ],
                    ),
                    SizedBox(height: AppSizeHeight.h4,),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: productModel.numberRating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          wrapAlignment: WrapAlignment.start,
                          itemSize: AppSize.s14,
                          maxRating: 5,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: ColorManager.yellow,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        Text(' (${productModel.numberRating})')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          //*Remove favorite
          Positioned(
            right: 3,
            top: 3,
            child: GestureDetector(onTap: (){},
          child:   Icon(Icons.close, color: ColorManager.grey,),))
        ],
      ),
    );
  }
}
