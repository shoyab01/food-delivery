import 'package:flutter/material.dart';
import 'package:food_delivery/data/categoryData.dart';
import 'package:food_delivery/models/categoryModel.dart';
import 'package:food_delivery/screens/components/foodCard.dart';


class FoodCategory extends StatelessWidget{
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context ,int index )
        {
          return FoodCard(
            categoryName: _categories[index].categoryName,
            imagePath: _categories[index].imagePath,
            noOfItem: _categories[index].noOfItem,
            
          );
        },
      ),
    );
  }

}