import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientCard extends StatelessWidget {

  Color colorTop;
  Color colorBottom;
  Widget child;

  GradientCard({this.child, this.colorTop, this.colorBottom});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Color(0x60000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1),
            colors: [colorTop, colorBottom],
            stops: [0, 1],
          ),
        ),
        child: child,
      ),
    );
  }
}
