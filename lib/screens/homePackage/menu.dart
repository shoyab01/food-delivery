import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:food_delivery/data/menuData.dart';
import 'package:food_delivery/models/foodModel.dart';

class Menu extends StatefulWidget {
  String resName;
  Menu({this.resName});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<FoodData> _foods = menus;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FontStyle.primaryColor,
            )),
        title: Text(
          arguments.values.first,
          overflow: TextOverflow.ellipsis,
          style: FontStyle.productsansBold(null, 45),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: _foods.map(buildMenu).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu(FoodData food) {
    return Card(
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
            Column(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "A variety of hand picked mushrooms, cooked to perfection, mixed in with velvety cream and served with freshly chopped scallions",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
            Spacer(),
            Card(
              elevation: 5.0,
              child: Container(
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                child: food.orderCount == 0
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            food.orderCount++;
                          });
                        },
                        child: Text(
                          "ADD",
                          textAlign: TextAlign.center,
                          style: FontStyle.productsansBold(Colors.green, 39),
                        ),
                      )
                    : Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                food.orderCount--;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: FontStyle.primaryColor.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                          Spacer(),
                          Text(
                            food.orderCount.toString(),
                            style:
                                FontStyle.productsansMedium(Colors.green, 40),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                food.orderCount++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
