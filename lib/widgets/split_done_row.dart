import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';

class SplitDoneRow extends StatelessWidget {

  SplitUserModel _sender, _receiver;
  double _amount;

  SplitDoneRow(this._sender, this._receiver, this._amount);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;



    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SplitUserCard(_sender, onlyName: true,),
        Container(
          width: 80,
          child: Column(
            children: [
              AutoSizeText(
                signedString(_amount, withPlus: false),
                style: theme.textTheme.bodyText1,
              ),
              Icon(
                CustomIcons.arrow,
                color: theme.hintColor.withAlpha(80),
              )
            ],
          ),
        ),
        SplitUserCard(_receiver, onlyName: true,),
      ],
    );
  }
}
