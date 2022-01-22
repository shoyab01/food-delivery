import 'package:flutter/material.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: FontStyle.primaryColor,
          ),
        ),
        title: Text(
          "Checkout",
          style: FontStyle.productsansBold(null, 45),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          
        ),
      ),
    );
  }
}
