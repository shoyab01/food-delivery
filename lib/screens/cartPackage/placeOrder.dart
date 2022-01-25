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
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextFormField(
                  enabled: false,
                  initialValue: "mark.facebook@gmail.com",
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: FontStyle.primaryColor.withOpacity(0.2),
                    filled: true,
                    labelText: "Email Address",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FontStyle.secondaryColor,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    labelStyle: FontStyle.productsansSemiBold(
                        FontStyle.primaryColor.withOpacity(0.7), 45.0),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: "Mark",
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "First Name",
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FontStyle.secondaryColor,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 0.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          labelStyle: FontStyle.productsansSemiBold(
                              FontStyle.primaryColor.withOpacity(0.7), 45.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: "Zuckerberg",
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Last Name",
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FontStyle.secondaryColor,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 0.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: FontStyle.secondaryColor, width: 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          labelStyle: FontStyle.productsansSemiBold(
                              FontStyle.primaryColor.withOpacity(0.7), 45.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: "Maithrivanam, Ameerpet, Hyderabad, 500055",
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Address",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FontStyle.secondaryColor,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    labelStyle: FontStyle.productsansSemiBold(
                        FontStyle.primaryColor.withOpacity(0.7), 45.0),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: "1234567890",
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: "Phone Number",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FontStyle.secondaryColor,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: FontStyle.secondaryColor, width: 0.5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    labelStyle: FontStyle.productsansSemiBold(
                        FontStyle.primaryColor.withOpacity(0.7), 45.0),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Proceed to pay ₹26.5',
                      style: FontStyle.productsansBold(Colors.white, 45),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
