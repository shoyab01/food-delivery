import 'package:flutter/material.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                        backgroundImage:
                            Image.asset("assets/mark_mavayya.jpg").image,
                        radius: 50),
                  ),
                  SizedBox(height: 8),
                  Text('Mark Zuckerberg',
                      style: TextStyle(
                          color: FontStyle.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 8),
                  Text('mark.facebook@gmail.com',
                      style: TextStyle(
                          color: FontStyle.secondaryColor, fontSize: 14)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: FontStyle.secondaryColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 23,
                            color: FontStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Notification",
                              style: TextStyle(
                                  color: FontStyle.secondaryColor,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,
                            size: 23,
                            color: FontStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Invite Friends",
                              style: TextStyle(
                                  color: FontStyle.secondaryColor,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 23,
                            color: FontStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Settings",
                              style: TextStyle(
                                  color: FontStyle.secondaryColor,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.miscellaneous_services,
                            size: 23,
                            color: FontStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Other Services",
                              style: TextStyle(
                                  color: FontStyle.secondaryColor,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                        color: FontStyle.secondaryColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    print("Logout");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 23,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Logout",
                          style: TextStyle(color: Colors.white, fontSize: 14))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
