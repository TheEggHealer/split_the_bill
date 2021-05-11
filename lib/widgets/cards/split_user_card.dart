import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class SplitUserCard extends StatelessWidget {
  
  SplitUserModel _model;
  bool onlyName;
  
  SplitUserCard(this._model, {this.onlyName = false});
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    
    return Card(
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
              '${_model.name}',
              style: theme.textTheme.headline4,
              maxLines: 1,
            ),
            if(!onlyName) AutoSizeText(
              signedString(_model.split),
              style: theme.textTheme.bodyText1,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}