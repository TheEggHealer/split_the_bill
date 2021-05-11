import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget inputField({String title, String hint, TextEditingController controller, TextInputType keyboardType = TextInputType.text, Function validator}) {
  ThemeData theme = Get.theme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.headline2,
      ),
      SizedBox(
        //height: 40,
        child: TextFormField(
          validator: validator,
          textAlignVertical: TextAlignVertical.top,
          style: theme.textTheme.subtitle1,
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.hintColor.withAlpha(100),
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.hintColor.withAlpha(100),
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.errorColor.withAlpha(100),
                width: 1,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.errorColor.withAlpha(100),
                width: 2,
              ),
            ),
            errorStyle: theme.textTheme.bodyText2.apply(color: theme.errorColor),
            hintStyle: theme.textTheme.headline3,
          ),
          cursorColor: theme.primaryColor,
          keyboardType: keyboardType,
        ),
      ),
    ],
  );
}