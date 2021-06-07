import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';

class GuideScaffold extends StatelessWidget {

  final String title;
  final bool last;
  final String counterText;
  final Widget body;
  final Function onContinue;
  final IconButton backButton;

  GuideScaffold({this.title, this.body, this.backButton, this.onContinue, this.last, this.counterText});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    ThemeData theme = Get.theme;

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: height,
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: Get.height - 200,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.9, 1],
                    colors: [Colors.transparent, Colors.white],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 24, right: 24),
                        child: Stack(
                          children: [
                            if(backButton != null) backButton,
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Guide',
                                style: theme.textTheme.headline1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        title,
                        style: theme.textTheme.headline2,
                      ),
                      SizedBox(height: 10),
                      body,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: authButton(
                  text: last ? 'Continue' : 'Next',
                  onTap: onContinue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      counterText,
                      style: theme.textTheme.bodyText1,
                    ),
                    if(!last) SizedBox(width: 10,),
                    if(!last) raisedButton(
                      text: 'Skip',
                      onTap: () async {
                        UserModel user = Get.find();
                        SplitUserModel createdUser = await Get.to(() => AddSplitUser.create());
                        user.create(createdUser.name, createdUser.color);

                        Get.until((route) => route.isFirst);
                      },
                      icon: CustomIcons.arrow,
                      expand: false,
                    ),
                  ],
                ),
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
    );
  }
}
