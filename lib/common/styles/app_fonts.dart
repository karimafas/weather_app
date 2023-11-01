import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle header(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 22,
        fontWeight: fontWeight ?? FontWeight.bold,
      );

  static TextStyle body(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
}
