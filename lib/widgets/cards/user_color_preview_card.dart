import 'package:flutter/material.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class UserColorPreviewCard extends StatelessWidget {

  Color _color;

  UserColorPreviewCard(this._color);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: _color.withAlpha(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        width: 80,
        height: 72,
        child: Center(
          child: Icon(
            CustomIcons.profile,
            color: _color,
            size: 30,
          ),
        ),
      ),
    );
  }
}
