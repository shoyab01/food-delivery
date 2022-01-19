import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_delivery/ThemeData/fontstyle.dart';
import 'package:food_delivery/screens/mainScreen.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:email_validator/email_validator.dart';

import '../components/customprogressbutton.dart';
import '../components/spinloader.dart';

class SignInSignUp extends StatefulWidget {
  @override
  _SignInSignUpState createState() => _SignInSignUpState();
}

final _colorG1 = Color.fromRGBO(850, 100, 758, 1.25);
final _colorG2 = Color.fromRGBO(55, 20, 15, 1);

final _colorG3 = Color.fromRGBO(450, 171, 255, 1);
final _colorG4 = Color.fromRGBO(120, 241, 255, 1);

final _colorBtn1 = Color.fromRGBO(0, 207, 200, 1);
final _colorBtn2 = Color.fromRGBO(0, 241, 158, 1);

final _actionBtnColor = Color.fromRGBO(255, 131, 82, 1);

class _SignInSignUpState extends State<SignInSignUp>
    with TickerProviderStateMixin {
  Animation<double> btnAnimation;
  AnimationController actionBtnCtrl;
  Animation<double> curveAnimation;
  AnimationController curveCtrl;
  Animation<double> animationInputs;
  AnimationController animationControllerInputs;
  Animation<double> titleAnimation;
  AnimationController titleCtrl;

  String _actionBtnText = 'Sign Up';
  String _currentPage = 'Sign In';
  bool isForgotVisible = true;

  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  TextEditingController _userNameTextController = new TextEditingController();

  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  String response;

  bool isLoadingGoogle = false;
  bool _isObscurePressed = true;

  void spincallbackgoogle(val, e) {
    setState(() {
      isLoadingGoogle = val;
      response = e;
    });
  }

  @override
  void initState() {
    super.initState();

    actionBtnCtrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    titleCtrl =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    titleAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: titleCtrl,
      curve: Curves.easeInCubic,
    ));

    curveCtrl = AnimationController(
      value: 0.0,
      duration: Duration(milliseconds: 750),
      upperBound: 0.5,
      lowerBound: 0,
      vsync: this,
    );

    btnAnimation = Tween<double>(begin: 0, end: -120).animate(CurvedAnimation(
      parent: actionBtnCtrl,
      curve: Curves.easeInCubic,
    ));

    animationControllerInputs =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    actionBtnCtrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(milliseconds: 150), () {
          if (_actionBtnText == 'Sign Up') {
            setState(() {
              _actionBtnText = 'Sign In';
              _currentPage = 'Sign Up';
            });
          } else {
            setState(() {
              _actionBtnText = 'Sign Up';
              _currentPage = 'Sign In';
            });
          }
          actionBtnCtrl.reverse();
          animationControllerInputs.reverse();
          titleCtrl.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    actionBtnCtrl.dispose();
    curveCtrl.dispose();
    animationControllerInputs.dispose();
    titleCtrl.dispose();
    super.dispose();
  }

  void _switchPage() {
    // Forgot password animation
    var dur = isForgotVisible ? 0 : 500;
    Timer(Duration(milliseconds: dur), () {
      setState(() {
        isForgotVisible = !isForgotVisible;
      });
    });

    // other animations
    titleCtrl.forward();
    animationControllerInputs.forward();
    actionBtnCtrl.forward();

    // top/bottom sections animation
    if (_actionBtnText == 'Sign Up') {
      curveCtrl.forward();
    } else {
      curveCtrl.reverse();
    }
  }

  Widget navButton() {
    return Container(
      height: 50.0,
      width: 120.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(65.0),
          bottomRight: Radius.circular(65.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(208, 209, 217, 0.5),
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          onTap: _switchPage,
          child: Center(
            child: Text(_actionBtnText,
                style: FontStyle.productsansSemiBold(_actionBtnColor, 50)),
          ),
        ),
      ),
    );
  }

  Widget socialMediaLogin() {
    return isLoadingGoogle
        ? spinLoader(150.h, 150.h, Colors.teal)
        : Container(
            width: 150.h,
            height: 150.h,
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 3)],
                borderRadius: BorderRadius.circular(50),
                color: Colors.white),
            child: Image.asset(
              "assets/google.png",
              fit: BoxFit.contain,
            ),
          );
  }

  Widget buildNavButton() {
    return AnimatedBuilder(
      animation: actionBtnCtrl,
      child: navButton(),
      builder: (context, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: Offset(btnAnimation.value, 0),
            child: child,
          ),
        );
      },
    );
  }

  Widget inputContainer(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        
        children: [
          Container(
            height: _currentPage == 'Sign In' ? 110 : 160,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(65.0),
                bottomRight: Radius.circular(65.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(208, 209, 217, 0.5),
                  offset: Offset(0.0, 1.0),
                  blurRadius: 8.0,
                  spreadRadius: 0.3,
                ),
              ],
            ),
            child: Form(
              key: _currentPage == "Sign Up" ? _registerFormKey : _loginFormKey,
              child: Container(
                padding: EdgeInsets.only(left: 16.0, right: 32.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Feather.mail,
                            color: Color.fromRGBO(203, 207, 218, 1),
                            size: 22.0,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Flexible(
                            child: TextFormField(
                              validator: (val) {
                                return EmailValidator.validate(val) &&
                                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val)
                                    ? null
                                    : "Please enter a valid email";
                              },
                              scrollPadding: EdgeInsets.all(25),
                              controller: _emailTextController,
                              maxLength: 45,
                              decoration: FontStyle.setLabel(
                                  "Email Address", null, null, context),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor:
                                  FontStyle.secondaryColor.withOpacity(0.3),
                              style: FontStyle.textFieldStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Color.fromRGBO(208, 209, 217, 1),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Feather.lock,
                            color: Color.fromRGBO(203, 207, 218, 1),
                            size: 22.0,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Flexible(
                            child: TextFormField(
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Password is too short";
                              },
                              controller: _passwordTextController,
                              maxLength: 25,
                              keyboardType: TextInputType.text,
                              decoration: FontStyle.setLabel(
                                  "Password",
                                  null,
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isObscurePressed =
                                              !_isObscurePressed;
                                        });
                                      },
                                      child: Icon(
                                        _isObscurePressed
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 18,
                                        color: FontStyle.secondaryColor,
                                      )),
                                  context),
                              cursorColor:
                                  FontStyle.secondaryColor.withOpacity(0.3),
                              obscureText: _isObscurePressed,
                              style: FontStyle.textFieldStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_currentPage == 'Sign Up')
                      Divider(
                        height: 1,
                        color: Color.fromRGBO(208, 209, 217, 1),
                      ),
                    if (_currentPage == 'Sign Up')
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Icon(
                                Feather.user,
                                color: Color.fromRGBO(203, 207, 218, 1),
                                size: 22.0,
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Flexible(
                              child: TextFormField(
                                validator: (val) {
                                  return val.length > 2
                                      ? null
                                      : "UserName is too short";
                                },
                                controller: _userNameTextController,
                                maxLength: 30,
                                decoration: FontStyle.setLabel(
                                    "User Name", null, null, context),
                                keyboardType: TextInputType.text,
                                cursorColor: FontStyle.secondaryColor,
                                style: FontStyle.textFieldStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          _currentPage == 'Sign In'
              ? customButtonWidget(
                  context, Icons.arrow_forward, stateOnlyText, onSignInPress)
              : customButtonWidget(
                  context, Icons.check, stateOnlyText, onSignUpPress),
        ],
      ),
    );
  }

  Widget buildInputsAndButton(context) {
    return AnimatedBuilder(
        animation: animationControllerInputs,
        child: inputContainer(context),
        builder: (context, child) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(animationInputs.value, 0),
              child: child,
            ),
          );
        });
  }

  Widget title() {
    return Text(_currentPage, style: FontStyle.productsansBold(null, 100));
  }

  Widget buildTitle() {
    return AnimatedBuilder(
        animation: titleCtrl,
        child: title(),
        builder: (context, child) {
          return Opacity(
            opacity: titleAnimation.value,
            child: child,
          );
        });
  }

  Widget _buildTopSection(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: curveCtrl,
      builder: (context, child) {
        return ClipPath(
            clipper: TopSectionClipper(curveCtrl.value), child: child);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_colorG1, _colorG2, _colorG2],
          ),
        ),
        height: size.height / 4,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget _buildCenterSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          buildTitle(),
          Spacer(
            flex: 2,
          ),
          buildInputsAndButton(context),
          Spacer(
            flex: 2,
          ),
          Row(
            children: [
              buildNavButton(),
              Spacer(),
              if (_currentPage == 'Sign In')
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "reset_password");
                  },
                  child: AnimatedBuilder(
                      animation: animationControllerInputs,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: FontStyle.secondaryColor),
                        ),
                      ),
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.translate(
                            offset: Offset(animationInputs.value, 0),
                            child: child,
                          ),
                        );
                      }),
                ),
            ],
          ),
          Spacer(
            flex: 3,
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Text(
            "or continue with",
            style: FontStyle.productsansMedium(
                FontStyle.primaryColor.withOpacity(0.5), 56),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          socialMediaLogin(),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: curveCtrl,
      builder: (context, child) {
        return ClipPath(
            clipper: BottomSectionClipper(curveCtrl.value), child: child);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [_colorG3, _colorG4, _colorG4],
          ),
        ),
        height: size.height / 4,
        alignment: Alignment.topCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var size = MediaQuery.of(context).size;
    animationInputs =
        Tween<double>(begin: 0, end: -size.width).animate(CurvedAnimation(
      parent: animationControllerInputs,
      curve: Curves.easeInCubic,
    ));
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          bottom: false,
          child: KeyboardAvoider(
            autoScroll: true,
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: <Widget>[
                  _buildTopSection(context),
                  _buildCenterSection(context),
                  _buildBottomSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSignInPress() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_loginFormKey.currentState.validate()) {
      setState(() {
        stateOnlyText = ButtonState.loading;
      });
      print("Sign In");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  currentIndex: 0,
                )),
      );
    } else {
      setState(() {
        stateOnlyText = ButtonState.fail;
      });
      Timer(Duration(seconds: 4), () {
        setState(() {
          stateOnlyText = ButtonState.idle;
        });
      });
    }
  }

  void onSignUpPress() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_registerFormKey.currentState.validate()) {
      setState(() {
        stateOnlyText = ButtonState.loading;
      });
      print("Sign Up");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  currentIndex: 0,
                )),
      );
    } else {
      setState(() {
        stateOnlyText = ButtonState.fail;
      });
      Timer(Duration(seconds: 4), () {
        setState(() {
          stateOnlyText = ButtonState.idle;
        });
      });
    }
  }

  void buttonCallback(buttonState, response) {
    setState(() {
      if (response != null) {
        response = response;
      }
      if (buttonState != null) {
        stateOnlyText = buttonState;
      }
    });
  }
}

class BottomSectionClipper extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  BottomSectionClipper(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height / 1.5);
    double xCtrlPoint = size.width * math.sin(move * slice);
    double yCtrlPoint = size.height * 0.8 + 69 * math.cos(move * slice);
    ;
    var endPoint = Offset(size.width, 0);
    path.quadraticBezierTo(xCtrlPoint, yCtrlPoint, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopSectionClipper extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  TopSectionClipper(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    double xCenter =
        (size.width / 6) + (size.width * 0.6 + 50) * math.sin(move * slice);
    double yCenter = 0;

    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(xCenter, yCenter, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
