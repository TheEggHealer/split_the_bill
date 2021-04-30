import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';

class SplitUserCard extends StatelessWidget {
  
  SplitUserModel _model;
  
  SplitUserCard(this._model);
  
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
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person,
              color: _model.color,
              size: 30,
            ),
            AutoSizeText(
              '${_model.name}',
              style: theme.textTheme.bodyText1,
              maxLines: 1,
            ),
            Text(
              '${_model.difference}',
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
