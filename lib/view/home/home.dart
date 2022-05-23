import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_meme/model/product_provider.dart';
import 'package:shop_meme/view/resources/locale_keys.dart';
import 'package:shop_meme/view/resources/values_manager.dart';
import 'package:shop_meme/view/widget/new_product_home.dart';
import 'package:shop_meme/view/widget/title_desc_home.dart';
import 'package:shop_meme/view/widget/top_sale_home.dart';
import 'package:shop_meme/view/widget/top_sold_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context).getProduct;
var size = MediaQuery.of(context).size;
 final double itemHeight = (size.height) / 2;
 final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //*Slider
          SizedBox(
            height: AppSizeHeight.h27,
            child: Swiper(
                itemCount: productsData.length,
                control: SwiperControl(
                    color: Theme.of(context).textSelectionHandleColor),
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => () {},
                    child: Container(
                      child: Stack(children: [
                        Image.network(productsData[index].imageUrl,
                            fit: BoxFit.fitHeight,
                            width: MediaQuery.of(context).size.width),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    end: const Alignment(0.0, -1),
                                    begin: const Alignment(0, 0.2),
                                    colors: [
                                  Colors.black54,
                                  Colors.black.withOpacity(0.1),
                                ])),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                productsData[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                }),
          ),
          //*Body
          Column(
            children: [
              SizedBox(
                height: AppSizeHeight.h4,
              ),
              //*Sale
              TitleDescHome(
                title: LocaleKeys.sale,
                desTitle: LocaleKeys.descSale,
                onPressViewAll: () {},
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: AppSizeHeight.hWidgetHome,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsData.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: productsData[index],
                          child: TopSaleHome(),
                          );
                    }),
              ),
              //*News
              TitleDescHome(
                title: LocaleKeys.neww,
                desTitle: LocaleKeys.descNew,
                onPressViewAll: () {},
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: AppSizeHeight.hWidgetHome,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsData.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: productsData[index],
                          child: NewProductHome(),
                          );
                    }),
              ),
              //*Sold
              TitleDescHome(title: LocaleKeys.sold, desTitle: LocaleKeys.descSold, onPressViewAll: (){}),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(AppSize.s12),
                child: GridView.builder(
                  itemCount: productsData.length,
                  shrinkWrap: true,
                  
                physics: new NeverScrollableScrollPhysics(),
                  //  controller: new ScrollController(keepScrollOffset: false),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                 childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2,  
                    crossAxisSpacing: 8.0,  
                    mainAxisSpacing: 8.0 ,
                ),  
                itemBuilder: (context, index){
                  return ChangeNotifierProvider.value(value: productsData[index],
                   child: TopSoledHome(),
                  );
                },
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
