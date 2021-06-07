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
    double height = Get.height;
    ThemeData theme = Get.theme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 120),
                    child: Center(
                      child: SizedBox(
                        width: height / 3.2,
                        height: height / 3.2,
                        child: icon,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: theme.textTheme.headline1,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 120),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: body,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset('assets/devyne_banner.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
