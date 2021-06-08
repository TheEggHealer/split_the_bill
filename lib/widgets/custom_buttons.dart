
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
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
*/

Widget authButton({String text, Function onTap, double hPadding = 40}) {
  ThemeData theme = Get.theme;

  ButtonStyle style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all(theme.splashColor),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    )),
    elevation: MaterialStateProperty.all(5),
    shadowColor: MaterialStateProperty.all(Color(0x60000000)),
  );

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: hPadding),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: style,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffF5DF90), Color(0xffE9C48D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: theme.textTheme.button,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget raisedButton({String text, bool expand = false, IconData icon, Function onTap, Color color, bool enabled = true}) {
  ThemeData theme = Get.theme;

  ButtonStyle style = ButtonStyle(
    elevation: MaterialStateProperty.all(enabled ? 5 : 0),
    shadowColor: MaterialStateProperty.all(Color(0x60000000)),
    backgroundColor: MaterialStateProperty.all<Color>(enabled ? (color == null ? theme.accentColor : color) : theme.disabledColor),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon != null) Icon(icon, size: 15,),
          if(icon != null) SizedBox(width: 5,),
          AutoSizeText(
            text,
            style: theme.textTheme.bodyText2.apply(color: theme.backgroundColor),
          ),
        ],
      ),
      onPressed: enabled ? onTap : null,
    ),
  );

  if(expand) return Expanded(child: button,);
  else return button;
}