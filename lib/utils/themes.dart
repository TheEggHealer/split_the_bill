import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  backgroundColor: Color(0xfffcfcfc),
  primaryColor: Color(0xff222222),
  accentColor: Color(0xffADD19D),
  cardColor: Color(0xffffffff),
  splashColor: Color(0x11000000),
  hintColor: Color(0xff969696),
  errorColor: Color(0xffDA5B5B),

  textTheme: TextTheme(
    headline1: bold.apply(color: Color(0xff343434), fontSizeFactor: 2),
    headline2: medium.apply(color: Color(0xff858585), fontSizeFactor: 1.3),
    headline3: medium.apply(color: Color(0xffc0c0c0), fontSizeFactor: 1.3),
    headline4: medium.apply(color: Color(0xff343434), fontSizeFactor: 1),
    bodyText1: font.apply(color: Color(0xff343434), fontSizeFactor: 1),
    bodyText2: font.apply(color: Color(0xff343434), fontSizeFactor: 0.85),
    subtitle1: font.apply(color: Color(0xff343434), fontSizeFactor: 1.3),
    button:    font.apply(color: Color(0xff343434), fontSizeFactor: 1),
  ),
);

TextStyle font = TextStyle(
  fontFamily: 'RedHat',
  fontSize: 16,
  fontWeight: FontWeight.w200,
  //height: 1,
);

TextStyle medium = TextStyle(
  fontFamily: 'RedHat',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  //height: 1,
);

TextStyle bold = TextStyle(
  fontFamily: 'RedHat',
  fontSize: 16,
  fontWeight: FontWeight.bold,
  //height: 1,
);