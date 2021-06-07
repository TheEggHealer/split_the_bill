import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/payment_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';

class SplitDoneRow extends StatelessWidget {

  PaymentModel _model;
  bool guide = false;

  SplitDoneRow(this._model);

  SplitDoneRow.guide() {
    guide = true;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    if(guide) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplitUserCard.guide(),
          Container(
            width: 80,
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.disabledColor,
                  ),
                ),
                Icon(
                  CustomIcons.arrow,
                  color: theme.hintColor.withAlpha(80),
                )
              ],
            ),
          ),
          SplitUserCard.guide(),
        ],
      );
    } else return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SplitUserCard(_model.sender, onlyName: true,),
        Container(
          width: 80,
          child: Column(
            children: [
              AutoSizeText(
                signedString(_model.amount, withPlus: false),
                style: theme.textTheme.bodyText1,
              ),
              Icon(
                CustomIcons.arrow,
                color: theme.hintColor.withAlpha(80),
              )
            ],
          ),
        ),
        SplitUserCard(_model.receiver, onlyName: true,),
      ],
    );
  }
}
