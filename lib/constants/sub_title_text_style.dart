import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextConstants {
  static TextStyle kMainTextStyle({double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? textColour}) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: fontFamily ?? 'Barlow',
      color: textColour ?? Colors.black,
    );
  }

  static TextStyle kSubTextStyle({double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? textColour}) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: fontFamily ?? 'Barlow',
      color: textColour ?? Colors.black45,
    );
  }
}
