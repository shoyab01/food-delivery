import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget spinLoader(double w, double h) {
  return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue.shade300,
      ),
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 20,
        ),
      ));
}

Widget loadingScreen(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: SpinKitChasingDots(
        color: FontStyle.primaryColor,
        size: 56,
      ),
    ),
  );
}
