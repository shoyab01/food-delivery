import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 2.0,
      child: TextField(
        scrollPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: InputDecoration(
          hintText: "Search any food",
          suffixIcon: Material(
            elevation: 0.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
        ),
      ),
    );
  }
}
