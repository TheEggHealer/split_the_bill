import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthScaffold extends StatelessWidget {

  final String title;
  final SvgPicture icon;
  final Widget body;

  AuthScaffold({this.title, this.icon, this.body});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ThemeData theme = Get.theme;


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: SizedBox(
                    width: height / 3.2,
                    height: height / 3.2,
                    child: icon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Text(
                  title,
                  style: theme.textTheme.headline1,
                ),
              ),
              body
            ],
          ),
        ),
      ),
    );
  }
}
