import 'package:flutter/material.dart';
import 'package:food_delivery/screens/components/spinloader.dart';
import 'package:progress_state_button/progress_button.dart';

Widget customButtonWidget(
    BuildContext context, IconData iconData, state, onPress) {
  if (state == ButtonState.idle) {
    return registerLoginButton(iconData, onPress);
  } else if (state == ButtonState.loading) {
    return Flexible(child: spinLoader(40, 40, Colors.teal));
  } else {
    return registerLoginButton(iconData, onPress);
  }

  // return ProgressButton(
  //   maxWidth: 50.0,
  //   height: 50.0,
  //   radius: 50.0,
  //   onPressed: onPress,
  //   stateColors: {
  //     ButtonState.idle: Color.fromRGBO(0, 207, 200, 1),
  //     ButtonState.loading: Colors.blue.shade300,
  //     ButtonState.fail: Colors.red.shade300,
  //     ButtonState.success: Colors.green.shade400,
  //   },
  //   stateWidgets: {
  //     ButtonState.idle: registerLoginButton(iconData),
  //     ButtonState.loading: registerLoginButton(iconData),
  //     ButtonState.fail: registerLoginButton(iconData),
  //     ButtonState.success: registerLoginButton(iconData),
  //   },
  //   state: state,
  //   padding: EdgeInsets.all(5.0),
  // );
}

Widget registerLoginButton(IconData iconData, Function onPress) {
  return Expanded(
    child: ClipOval(
      child: Material(
        color: Colors.teal,
        child: InkWell(
          onTap: onPress,
          child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(iconData, color: Colors.white)),
        ),
      ),
    ),
  );
  // return Material(
  //   clipBehavior: Clip.hardEdge,
  //   color: Colors.blue,
  //   child: Center(
  //     child: Icon(
  //       iconData,
  //       size: 24,
  //       color: Colors.white,
  //     ),
  //   ),
  // );
}
