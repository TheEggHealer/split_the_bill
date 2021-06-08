import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplitScaffold extends StatelessWidget {

  final String title;
  final SvgPicture icon;
  final IconButton navButton;
  final IconButton rightButton;
  final IconButton helpButton;
  final Color colorLight;
  final Color colorDark;
  final Widget body;
  final Widget fab;

  SplitScaffold({this.title, this.icon, this.navButton, this.rightButton, this.helpButton, this.colorDark, this.colorLight, this.body, this.fab});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    double height = Get.size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      icon,
                      if(helpButton != null) helpButton,
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: navButton == null ? 28 : 8),
                  child: Row(
                    children: [
                      if(navButton != null) navButton,
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.headline1,
                        ),
                      ),
                      if(rightButton != null) rightButton,
                    ],
                  ),
                ),
                body,
              ],
            ),

            /*
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: clipHeight),
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
                  padding: EdgeInsets.only(bottom: 5),
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
             */
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: fab,
          ),
        ),
      ),
    );
  }
}
