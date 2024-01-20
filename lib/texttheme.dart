import 'package:flutter/material.dart';

TextTheme buildCustomTextTheme() {
  return TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
    subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(fontSize: 16.0),
    bodyText2: TextStyle(fontSize: 14.0),
    button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    caption: TextStyle(fontSize: 12.0),
    overline: TextStyle(fontSize: 10.0),
  );
}