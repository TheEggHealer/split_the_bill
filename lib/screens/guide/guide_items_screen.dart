import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/controllers/split_controller.dart';
import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/screens/guide/guide_done_screen.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/cards/split_item_card.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/guide_scaffold.dart';

class GuideItemsScreen extends StatelessWidget {

  SplitModel model;

  GuideItemsScreen() {
    model = SplitModel();
    SplitUserModel eric = SplitUserModel('Eric', Color(0xffA2B768));
    SplitUserModel john = SplitUserModel('John', Color(0xffB76868));
    eric.setSplit(-10);
    john.setSplit(10);

    SplitItemModel item = SplitItemModel();
    item.setBuyer(eric);
    item.setReceivers([eric, john]);
    item.setItemCost(20);
    item.setItemName('Bacon');

    model.users.add(eric);
    model.users.add(john);
    model.items.add(item);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    List<SplitUserCard> userCards = model.users.map((user) => SplitUserCard(user)).toList()..addAll([SplitUserCard.guide(), SplitUserCard.guide()]);


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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Items',
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
                        children: userCards,
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
                              enabled: false,
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
              SplitItemCard(model.items.first, guide: true,),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Items show what has been bought, how much it cost and how it affects the split. To add a new item, press the “+” button in the bottom right corner. ',
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
