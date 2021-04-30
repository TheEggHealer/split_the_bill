
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget authButton({String text, Function onTap}) {
  ThemeData theme = Get.theme;

  ButtonStyle style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(theme.primaryColor),
    overlayColor: MaterialStateProperty.all(theme.splashColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    )),
    side: MaterialStateProperty.all(BorderSide(
      width: 2.5,
      color: theme.primaryColor,
    )),
  );

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: style,
        child: Text(
          text,
          style: theme.textTheme.button
        ),
        onPressed: onTap,
      ),
    ),
  );
}