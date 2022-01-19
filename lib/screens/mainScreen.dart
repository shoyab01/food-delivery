import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/accountPackage/account.dart';
import 'package:food_delivery/screens/cartPackage/cart.dart';
import 'package:food_delivery/screens/favouritePackage/favourite.dart';
import 'package:food_delivery/screens/homePackage/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  int currentIndex;
  MainScreen({this.currentIndex});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _botNavList;

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex == null) {
      setState(() {
        widget.currentIndex = 0;
      });
    }
    _botNavList = [Home(), Favourite(), Cart(), Account()];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ));

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(child: _botNavList[widget.currentIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 50.h,
            ),
            Icon(
              Icons.favorite_outline,
              color: Colors.white,
              size: 50.h,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 50.h,
            ),
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 50.h,
            ),
          ],
          index: 0,
          height: 140.0.h,
          backgroundColor: Colors.grey[100],
          color: Colors.cyan[900],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
