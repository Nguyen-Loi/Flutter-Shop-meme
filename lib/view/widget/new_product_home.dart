import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/product.dart';
import 'package:shop_meme/view/resources/color_manager.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/valid_data_manager.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_meme/app/extension.dart';
import 'package:easy_localization/easy_localization.dart';

class NewProductHome extends StatelessWidget {
  const NewProductHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 12),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorManager.whiteCard,
                  ),
                  padding: EdgeInsets.all(AppSize.s12),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: NetworkImage(productModel.imageUrl),
                          height: AppSizeHeight.h25,
                          width: AppSizeWidth.w25,
                          fit: BoxFit.fill,
                        ),
                      ),
          
                    ],
                  )),
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
                    onRatingUpdate: (double value) {
                      
                    },
                  ),
                  Text(' (${productModel.numberRating})')
                ],
              ),
              Text(
                ValidDator.convertProductName(
                    length: 13, nameProduct: productModel.title),
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                productModel.price.toVND(),
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                ValidDator.caculateDiscount(
                        price: productModel.price,
                        discount: productModel.discountPrice)
                    .toVND(),
                           style: Theme.of(context).textTheme.headline4),
            ],
          ),
          Positioned(
                    right: 0,
                    top: AppSizeHeight.h25+5, 
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                         width: 35,
                      height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          
                           boxShadow: [
            BoxShadow(
                color: ColorManager.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
        ],
                        ),
                        
                        child:  productModel.isFavorite==true?Icon(
                                       Icons.favorite_border, color: ColorManager.grey, 
                        ):Icon(Icons.favorite_outlined, color: ColorManager.primary,)),
                    ),
                  
                    ),
                    Positioned(
                      
                      child: Container(      
                       alignment: Alignment.center,   
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                               color: ColorManager.darkPrimary,   
                               
                            ),
                            width: AppSize.s50,
                            height: AppSize.s25,
                            child: Text(LocaleKeys.neww.tr(), style: Theme.of(context).textTheme.subtitle2,),
                          ))
        ],
      ),
    );
  }
}
