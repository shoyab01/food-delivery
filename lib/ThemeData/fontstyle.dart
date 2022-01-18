import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyle {
  static Color primaryColor = Color.fromRGBO(7, 9, 32, 1);
  static Color secondaryColor = Color.fromRGBO(7, 9, 32, 1).withOpacity(0.5);

//to set the label for input text field
  static InputDecoration setLabel(
      String label, Icon prefixIcon, var suffixIcon, BuildContext context) {
    return InputDecoration(
      //isDense: true,
      labelText: label,
      counterText: "",
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
      labelStyle: productsansMedium(secondaryColor, 45.0),
      suffixIcon: suffixIcon == null ? null : suffixIcon,
      prefixIcon: prefixIcon == null ? null : prefixIcon,
    );
  }

  static InputDecoration setLabelAllBorders(
      String label, Icon prefixIcon, var suffixIcon, BuildContext context) {
    return InputDecoration(
      //isDense: true,
      labelText: label,
      counterText: "",
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: secondaryColor,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 1.5),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.0),
      labelStyle: productsansSemiBold(primaryColor.withOpacity(0.7), 45.0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  static TextStyle textFieldStyle() {
    return productsansMedium(primaryColor.withOpacity(0.7), 50);
  }

  static TextStyle productsansBlack(Color primary, double f1_32) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w800,
      color: primary == null ? primaryColor : primary,
      fontSize: f1_32 == null
          ? ScreenUtil().setSp(
              32.0,
            )
          : ScreenUtil().setSp(
              f1_32,
            ),
    );
  }

  static TextStyle productsansExtraBold(Color primary, double f3_20) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w900,
      color: primary == null ? primaryColor : primary,
      fontSize: f3_20 == null
          ? ScreenUtil().setSp(
              19,
            )
          : ScreenUtil().setSp(
              f3_20,
            ),
    );
  }

  static TextStyle productsansBold(Color primary, double f3_19) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w700,
      color: primary == null ? primaryColor : primary,
      fontSize: f3_19 == null
          ? ScreenUtil().setSp(
              19,
            )
          : ScreenUtil().setSp(
              f3_19,
            ),
    );
  }

  static TextStyle productsansBoldUnderline(Color primary, double f3_19) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w700,
      color: primary == null ? primaryColor : primary,
      decoration: TextDecoration.underline,
      fontSize: f3_19 == null
          ? ScreenUtil().setSp(
              19,
            )
          : ScreenUtil().setSp(
              f3_19,
            ),
    );
  }

  static TextStyle productsansSemiBold(Color primary, double f5_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w600,
      color: primary == null ? primaryColor : primary,
      fontSize: f5_14 == null
          ? ScreenUtil().setSp(
              14,
            )
          : ScreenUtil().setSp(
              f5_14,
            ),
    );
  }

  static TextStyle productsansSemiBoldUnderline(Color primary, double f5_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w600,
      color: primary == null ? primaryColor : primary,
      decoration: TextDecoration.underline,
      fontSize: f5_14 == null
          ? ScreenUtil().setSp(
              14,
            )
          : ScreenUtil().setSp(
              f5_14,
            ),
    );
  }

  static TextStyle productsansMedium(Color primary, double f4_16) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w400,
      color: primary == null ? primaryColor : primary,
      fontSize: f4_16 == null
          ? ScreenUtil().setSp(
              16,
            )
          : ScreenUtil().setSp(
              f4_16,
            ),
    );
  }

  static TextStyle productsansRegular(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(
              12,
            )
          : ScreenUtil().setSp(
              f6_12,
            ),
    );
  }

  static TextStyle productsansRegularUnderline(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(
              12,
            )
          : ScreenUtil().setSp(
              f6_12,
            ),
      decoration: TextDecoration.underline,
      decorationColor: primary == null ? primaryColor : primary,
    );
  }

  static TextStyle productsansLight(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(
              12,
            )
          : ScreenUtil().setSp(
              f6_12,
            ),
    );
  }

  static TextStyle productsansThin(Color primary, double f7_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f7_14 == null
          ? ScreenUtil().setSp(
              14,
            )
          : ScreenUtil().setSp(
              f7_14,
            ),
    );
  }

  static TextStyle productsansThinUnderline(Color primary, double f7_14) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontWeight: FontWeight.w300,
        color: primary == null ? primaryColor : primary,
        fontSize: f7_14 == null
            ? ScreenUtil().setSp(
                14,
              )
            : ScreenUtil().setSp(
                f7_14,
              ),
        decoration: TextDecoration.underline,
        decorationColor: primaryColor);
  }
}
