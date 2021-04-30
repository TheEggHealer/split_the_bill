import 'package:flutter/cupertino.dart';

class SplitAppbarClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    double height = size.height / 2;
    double op1 = size.width / 5;
    double op2 = op1 + size.width / 4;
    double op3 = op2 + size.width / 2;

    Offset p1 = Offset(size.width / 5, height + height / 4);
    Offset p2 = Offset(p1.dx + size.width / 4, height - height / 8);
    Offset p3 = Offset(p2.dx + size.width / 3, height + height / 3.5);

    Path path = Path();
    path.lineTo(0, height);
    path.cubicTo(0                          , height, p1.dx / 2                  , p1.dy , p1.dx     , p1.dy);
    path.cubicTo(p1.dx + (p2.dx - p1.dx) / 3, p1.dy , p2.dx - (p2.dx - p1.dx) / 3, p2.dy , p2.dx     , p2.dy);
    path.cubicTo(p2.dx + (p3.dx - p2.dx) / 3, p2.dy , (p2.dx + p3.dx) / 2        , p3.dy , p3.dx     , p3.dy);
    path.cubicTo((p3.dx + size.width) / 2   , p3.dy , size.width                 , height, size.width, height);
    //path.quadraticBezierTo(p1 / 2, height + height / 4, p1, height + height / 4);
    //path.quadraticBezierTo((p1 + p2) / 2, height - height / 8, p2, height - height / 8);
    //path.quadraticBezierTo((p2 + p3) / 2, height + height / 3.5, p3, height + height / 3.5);
    //path.quadraticBezierTo((size.width + p3) / 2, height, size.width, height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}