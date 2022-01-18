import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/user_cred/reset_pass.dart';
import 'package:food_delivery/screens/user_cred/signin_signup.dart';

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
      },
      initialRoute: '/',
    );
  }
}
