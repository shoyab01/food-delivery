import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/cartPackage/placeOrder.dart';
import 'package:food_delivery/screens/homePackage/menu.dart';
import 'package:food_delivery/screens/mainScreen.dart';
import 'package:food_delivery/screens/userCred/resetPass.dart';
import 'package:food_delivery/screens/userCred/signInSignUp.dart';

import 'ThemeData/fontstyle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: FontStyle.primaryColor,
        cursorColor: FontStyle.secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => SignInSignUp(),
        'reset_password': (context) => ResetPassword(),
        'main_screen': (context) => MainScreen(
              currentIndex: 2,
            ),
        'menu': (context) => Menu(),
        'place_order': (context) => PlaceOrder(),
      },
      initialRoute: 'main_screen',
    );
  }
}
