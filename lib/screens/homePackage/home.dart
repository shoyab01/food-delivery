import 'package:flutter/material.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:food_delivery/data/foodData.dart';
import 'package:food_delivery/models/foodModel.dart';
import 'package:food_delivery/screens/components/foodBought.dart';
import 'package:food_delivery/screens/components/foodCategory.dart';
import 'package:food_delivery/screens/components/searchBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<FoodData> _foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: FontStyle.primaryColor,
                ),
                Text("Hyderabad",
                    style: FontStyle.productsansExtraBold(null, 50)),
              ],
            ),
            Text(
              "Suraram, Hyderabad, Telangana, India",
              style: FontStyle.productsansLight(null, 28),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: [
                  Spacer(),
                  SearchBar(),
                  Spacer(),
                  FoodCategory(),
                  Spacer(),
                  Divider(),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Restaurants",
                  style: FontStyle.productsansBold(null, 50),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.orangeAccent),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: _foods.map(buildFoodBought).toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFoodBought(FoodData food) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFood(
        imagePath: food.imagePath,
        id: food.id,
        name: food.name,
        price: food.price,
        discount: food.discount,
        ratings: food.ratings,
        category: food.category,
      ),
    );
  }
}
