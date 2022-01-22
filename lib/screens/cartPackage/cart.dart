import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Your Food Cart",
            style: FontStyle.productsansBold(null, 45),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return cartWidget();
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cart Total",
                        style: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 45),
                      ),
                      Text(
                        "23.0",
                        style: FontStyle.productsansMedium(null, 45),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 45),
                      ),
                      Text(
                        "3.0",
                        style: FontStyle.productsansMedium(null, 45),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 45),
                      ),
                      Text(
                        "0.5",
                        style: FontStyle.productsansMedium(null, 45),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 45),
                      ),
                      Text(
                        "26.5",
                        style: FontStyle.productsansMedium(null, 45),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "place_order");
                      },
                      child: Text('Proceed to Checkout'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget cartWidget() {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Row(
          children: [
            Container(
              width: 32,
              decoration: BoxDecoration(
                border:
                    Border.all(color: FontStyle.primaryColor.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: FontStyle.primaryColor.withOpacity(0.5),
                  ),
                  Text(
                    "2",
                    style: FontStyle.productsansBold(
                        FontStyle.primaryColor.withOpacity(0.5), 40),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: FontStyle.primaryColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 60.0,
              width: 60.0,
              child: Image.asset(
                "assets/images/food.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Grilled Chicken",
                      style: FontStyle.productsansBold(null, 40),
                    ),
                    Spacer(),
                    Icon(
                      Icons.cancel,
                      color: FontStyle.secondaryColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "25.0",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: FontStyle.productsansRegular(
                      FontStyle.primaryColor.withOpacity(0.5), 40),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
