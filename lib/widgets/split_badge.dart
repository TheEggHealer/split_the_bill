import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';

class SplitBadge extends StatelessWidget {

  SplitUserModel _user;
  double _value;
  var expanded = false.obs;

  SplitBadge(this._user, this._value);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return GestureDetector(
      onTap: () {
        expanded.toggle();
      },
      child: Badge(
        toAnimate: false,
        elevation: 0,
        borderRadius: BorderRadius.circular(16),
        badgeColor: _user.color.withAlpha(25),
        shape: BadgeShape.square,
        padding: EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
        badgeContent: AnimatedSize(
          vsync: NavigatorState(),
          duration: Duration(milliseconds: 100),
          curve: Curves.ease,
          alignment: Alignment.centerLeft,
          child: Obx(() =>
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CustomIcons.profile,
                  size: 18,
                  color: _user.color,
                ),
                Row(
                  children: [
                    if(expanded.value) Text(
                      '${_user.name} ',
                      style: theme.textTheme.bodyText2,
                    ),
                    Text(
                      signedString(_value),
                      style: theme.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
