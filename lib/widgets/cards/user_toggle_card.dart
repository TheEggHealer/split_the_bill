import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class UserToggleCard extends StatelessWidget {

  SplitUserModel _model;
  var _value = false.obs;

  UserToggleCard(this._model, this._value);

  bool get value => _value.value;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return GestureDetector(
      onTap: () => _value.toggle(),
      child: Card(
        elevation: 0,
        color: _model.color.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          width: 70,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      CustomIcons.profile,
                      color: _model.color,
                      size: 30,
                    ),
                    AutoSizeText(
                      '${_model.name}',
                      style: theme.textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  ],
                ),
                Positioned(
                  bottom: -12,
                  child: Obx(() =>
                    Checkbox(
                      fillColor: MaterialStateProperty.all(theme.primaryColor),
                      checkColor: theme.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      value: _value.value,
                      onChanged: (value) => _value.toggle(),
                    )
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
