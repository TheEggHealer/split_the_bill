import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/split_badge.dart';

class SplitItemCard extends StatelessWidget {

  SplitItemModel _model;

  SplitItemCard(this._model);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    List<SplitBadge> receiverBadges = _model.receivers.map((u) => SplitBadge(u, _model.splitValue)).toList();

    return Card(
      elevation: 8,
      color: theme.cardColor,
      shadowColor: Color(0x60000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedSize(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
        alignment: Alignment.topCenter,
        vsync: NavigatorState(),
        child: Container(
          padding: EdgeInsets.only(left: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_model.itemName}, ${_model.itemCost}',
                    style: theme.textTheme.headline4,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(CustomIcons.edit),
                      iconSize: 20,
                      splashRadius: 20,
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SplitBadge(
                    _model.buyer,
                    -_model.itemCost,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CustomIcons.arrow,
                    color: theme.hintColor.withAlpha(80),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: receiverBadges,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
