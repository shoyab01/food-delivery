import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = new TextEditingController();
  ButtonState stateOnlyText = ButtonState.idle;
  final _resetFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: FontStyle.primaryColor,
            size: 24.0,
          ),
        ),
        title: Text(
          "Reset Password",
          style: FontStyle.productsansMedium(null, 56),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250.0.h,
            child: Form(
              key: _resetFormKey,
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Please enter your registered Email Address to update your account password",
                    style: FontStyle.productsansSemiBold(Colors.teal, 50),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (val) {
                        return EmailValidator.validate(val) &&
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                            ? null
                            : "Please enter a valid email";
                      },
                      scrollPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      controller: _emailTextController,
                      maxLength: 45,
                      decoration: InputDecoration(
                        prefix: Padding(
                            padding:
                                EdgeInsets.only(right: 25.0.w, top: 10.0.h),
                            child: Icon(
                              Feather.mail,
                              color: FontStyle.secondaryColor,
                              size: 22.0,
                            )),
                        //isDense: true,
                        labelText: "Email Address",
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FontStyle.secondaryColor,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: FontStyle.secondaryColor, width: 1.5),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: FontStyle.secondaryColor, width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: FontStyle.secondaryColor, width: 1.5),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 40.0.w,
                            right: 40.0.w,
                            top: 20.0.h,
                            bottom: 20.0.h),
                        labelStyle: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 50.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: FontStyle.secondaryColor.withOpacity(0.3),
                      style: FontStyle.textFieldStyle(),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  ElevatedButton(
                    onPressed: onResetPress,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal[800],
                      ),
                    ),
                    child: Text(
                      "Reset Password",
                      style: FontStyle.productsansBold(Colors.white, 52),
                    ),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onResetPress() async {
    if (_resetFormKey.currentState.validate()) {
      setState(() {
        stateOnlyText = ButtonState.loading;
      });
      print("Reset Password");
      // EmailPasswordAuth.resetPassword(_emailTextController.text, context)
      //     .then((value) {
      //   setState(() {
      //     stateOnlyText = ButtonState.idle;
      //   });
      //   final popup =
      //       BeautifulPopup(template: TemplateNotification, context: context);
      //   popup.show(
      //       title: "Success",
      //       content:
      //           "You will receive an email to reset password if your email is registered with us.",
      //       actions: [
      //         popup.button(
      //             label: 'close',
      //             onPressed: () {
      //               if (UserDetails.firebaseUser != null) {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => BottomNav(
      //                             currentIndex: 4,
      //                           )),
      //                 );
      //               } else {
      //                 Navigator.of(context).pop();
      //               }
      //             }),
      //       ],
      //       barrierDismissible: false,
      //       close: Container());
      // });
    }
  }
}
