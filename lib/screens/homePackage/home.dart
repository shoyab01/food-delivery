import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:food_delivery/data/foodData.dart';
import 'package:food_delivery/models/foodModel.dart';
import 'package:food_delivery/screens/components/foodCategory.dart';
import 'package:food_delivery/screens/components/searchBar.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
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
              height: MediaQuery.of(context).size.height / 3 + 20,
              child: Column(
                children: [
                  Spacer(),
                  SearchBar(),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Frequently visited restaurants",
                      textAlign: TextAlign.start,
                      style: FontStyle.productsansRegular(null, 40),
                    ),
                  ),
                  FoodCategory(),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Frequently ordered food",
                      textAlign: TextAlign.start,
                      style: FontStyle.productsansRegular(null, 40),
                    ),
                  ),
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "menu", arguments: {'resName': food.name});
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: Image.asset(
                      food.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Ameerpet",
                    style: FontStyle.productsansMedium(null, 36),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: FontStyle.productsansBold(null, 40),
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
                      "We imagine a world where there are no barriers between Boston residents, sloppily produced pizza doesn’t exist, and local farmers are able to live prosperously.",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
