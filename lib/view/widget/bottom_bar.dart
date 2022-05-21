import 'package:flutter/material.dart';
import 'package:shop_meme/view/bag/bag.dart';
import 'package:shop_meme/view/cart/cart.dart';
import 'package:shop_meme/view/favorite/favorite.dart';
import 'package:shop_meme/view/home/home.dart';
import 'package:shop_meme/view/profile/profile.dart';
import 'package:shop_meme/view/resources/color_manager.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> body = [Home(), Cart(), Bag(), Favorite(), Profile()];

  void onTapBottomView(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 1,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              // backgroundColor: Colors.green,
              type: BottomNavigationBarType.fixed,

              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: onTapBottomView,
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopify_rounded),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Bag',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Bag',
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 4,
          child: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          onPressed: () => setState(() {
            currentIndex = 2;
          }),
        ),
      ),
    );
  }
}
