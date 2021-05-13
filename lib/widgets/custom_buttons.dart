
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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

Widget raisedButton({String text, bool expand = false, IconData icon, Function onTap, Color color}) {
  ThemeData theme = Get.theme;

  ButtonStyle style = ButtonStyle(
    elevation: MaterialStateProperty.all(5),
    shadowColor: MaterialStateProperty.all(Color(0x60000000)),
    backgroundColor: MaterialStateProperty.all<Color>(color == null ? theme.accentColor : color),
    foregroundColor: MaterialStateProperty.all(theme.backgroundColor),
    overlayColor: MaterialStateProperty.all(theme.splashColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    )),
  );

  Widget button = SizedBox(
    height: 32,
    child: ElevatedButton(
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(icon != null) Icon(icon, size: 15,),
          SizedBox(width: 5,),
          AutoSizeText(
            text,
            style: theme.textTheme.bodyText2.apply(color: theme.backgroundColor),
          ),
        ],
      ),
      onPressed: onTap,
    ),
  );

  if(expand) return Expanded(child: button,);
  else return button;
}