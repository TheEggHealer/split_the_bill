import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  backgroundColor: Color(0xfffcfcfc),
  primaryColor: Color(0xff222222),
  cardColor: Color(0xffffffff),
  splashColor: Color(0x11000000),

  textTheme: TextTheme(
    headline1: font.apply(color: Color(0xff343434), fontSizeFactor: 2),
    headline2: font.apply(color: Color(0xff343434), fontSizeFactor: 2),
    bodyText1: font.apply(color: Color(0xff343434), fontSizeFactor: 1),
    bodyText2: font.apply(color: Color(0xff343434), fontSizeFactor: 0.85),
    button:    font.apply(color: Color(0xff343434), fontSizeFactor: 1),
  ),
);

TextStyle font = TextStyle(
  fontFamily: 'Crimson',
  fontSize: 16,
  fontWeight: FontWeight.bold,
  height: 1,
);