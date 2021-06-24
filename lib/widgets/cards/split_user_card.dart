import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';

class SplitUserCard extends StatelessWidget {
  
  SplitUserModel _model;
  bool onlyName;
  bool editable;
  bool guide = false;
  
  SplitUserCard(this._model, {this.onlyName = false, this.editable = false});

  SplitUserCard.guide() {
    guide = true;
  }
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    if(guide) {
      return Card(
        elevation: 0,
        color: Color(0xff818181).withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          width: 70,
          height: 85,
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      );
    }
    else return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 0,
          color: _model.color.withAlpha(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: 70,
            height: 85,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CustomIcons.profile,
                  color: _model.color,
                  size: 30,
                ),
                AutoSizeText(
                  '${_model.name.length >= 15 ? _model.name.replaceRange(12, _model.name.length, '... ') : _model.name}',
                  style: theme.textTheme.headline4,
                  minFontSize: 8,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if(!onlyName) AutoSizeText(
                  signedString(_model.split),
                  style: theme.textTheme.bodyText1,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        if(editable) Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              Get.to(() => AddSplitUser.edit(_model));
            },
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 70,
              height: 85,
            ),
          ),
        ),
      ],
    );
  }
}
