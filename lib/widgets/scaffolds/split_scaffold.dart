import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/widgets/clippers/split_appbar_clipper.dart';

class SplitScaffold extends StatelessWidget {

  final String title;
  final SvgPicture icon;
  final IconButton navButton;
  final Color colorLight;
  final Color colorDark;
  final Widget body;
  final FloatingActionButton fab;

  SplitScaffold({this.title, this.icon, this.navButton, this.colorDark, this.colorLight, this.body, this.fab});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    SplitAppbarClipper clipper = SplitAppbarClipper();
    double width = Get.size.width;
    double height = Get.size.height;
    double clipHeight = height * 0.2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //constraints: BoxConstraints(
          //  minHeight: height,
          //),
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: width,
                  minHeight: height,
                ),
                color: theme.backgroundColor,
                child: body,
              ),
              Container(
                decoration: BoxDecoration(
                  color: colorDark,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x10000000),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                      spreadRadius: 5,
                    )
                  ]
                ),
                constraints: BoxConstraints(
                  minWidth: width,
                  minHeight: clipHeight,
                ),
              ),
              ClipPath(
                clipper: clipper,
                child: Container(
                  width: width,
                  height: clipHeight,
                  color: colorLight,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: width,
                  minHeight: clipHeight,
                ),
                padding: EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    icon,
                    SizedBox(
                      width: width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              style: theme.textTheme.headline1
                            ),
                          ),
                          if(navButton != null) Material(
                            color: Colors.transparent,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: navButton,
                              ),
                            ),
                          )
                        ]
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}
