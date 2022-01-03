import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle style(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
