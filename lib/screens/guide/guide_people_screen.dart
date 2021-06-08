import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/screens/guide/guide_items_screen.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/guide_scaffold.dart';

class GuidePeopleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.95, 1],
          colors: [Colors.transparent, Colors.white],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Center(
                child: Text(
                  'People',
                  style: theme.textTheme.headline2,
                ),
              ),
              GradientCard(
                colorTop: theme.cardColor,
                colorBottom: Color(0xFFEEFFE7),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        children: [SplitUserCard.guide(), SplitUserCard.guide(), SplitUserCard.guide(), SplitUserCard.guide()],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            raisedButton(
                              text: 'Add member',
                              icon: Icons.add,
                              expand: true,
                            ),
                            SizedBox(width: 25,),
                            raisedButton(
                              text: 'Solve split',
                              icon: Icons.done,
                              expand: true,
                              enabled: false,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'To add new people to the split, tap the\n"+ Add member" button. Enter their name and give them a color!',
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
