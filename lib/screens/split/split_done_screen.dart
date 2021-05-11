import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/controllers/split_controller.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';
import 'package:split_the_bill/widgets/split_done_row.dart';

class SplitDoneScreen extends StatelessWidget {

  List<SplitDoneRow> calculateSplit() {
    SplitController controller = Get.find();
    List<SplitDoneRow> rows = [];

    List<SplitUserModel> senders = controller.users.where((user) => user.split > 0).map((user) => SplitUserModel.clone(user)).toList();
    List<SplitUserModel> receivers = controller.users.where((user) => user.split < 0).map((user) => SplitUserModel.clone(user)).toList();
    senders.sort((a, b) => a.split.compareTo(b.split));
    receivers.sort((a, b) => b.split.compareTo(a.split));

    while(receivers.length > 0) {
      SplitUserModel sender = senders.first;
      SplitUserModel receiver = receivers.first;
      double amount = min(sender.split, -receiver.split);

      sender.subtractSplit(amount);
      receiver.addSplit(amount);

      rows.add(SplitDoneRow(
        sender,
        receiver,
        amount
      ));

      if(sender.split == 0) senders.remove(sender);
      if(receiver.split == 0) receivers.remove(receiver);

      debug('Created split between ${sender.name} and ${receiver.name} for $amount');
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    UserModel user = Get.find();




    return GetBuilder<SplitController>(
      builder: (controller) {

        return SplitScaffold(
          title: 'Done!',
          icon: SvgPicture.asset('assets/coins.svg'),
          navButton: IconButton(
            icon: Icon(CustomIcons.back),
            onPressed: () => Get.back(),
            splashRadius: 20,
            iconSize: 30,
          ),
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                GradientCard(
                  colorTop: Color(0xFFFFFFFF),
                  colorBottom: Color(0xFFEFFFF4),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Optimal split',
                          style: theme.textTheme.headline2,
                        ),
                        SizedBox(height: 15),
                        Column(
                          children: calculateSplit(),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            raisedButton(
                              text: 'Copy as text',
                              icon: CustomIcons.copy,
                              expand: true,
                              onTap: () {

                              },
                            ),
                            SizedBox(width: 25,),
                            raisedButton(
                              text: 'Share',
                              icon: CustomIcons.edit,
                              expand: true,
                              onTap: () {

                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          fab: FloatingActionButton(
            child: Icon(
              Icons.done,
              size: 32,
              color: theme.backgroundColor,
            ),
            backgroundColor: theme.accentColor,
            onPressed: () {

            },
          ),
        );
      },
    );
  }
}
