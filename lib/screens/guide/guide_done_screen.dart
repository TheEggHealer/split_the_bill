import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/payment_model.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/guide_scaffold.dart';
import 'package:split_the_bill/widgets/split_done_row.dart';

class GuideDoneScreen extends StatelessWidget {

  SplitModel model;

  GuideDoneScreen() {
    model = SplitModel();

    SplitUserModel eric = SplitUserModel('Eric', Color(0xffA2B768));
    SplitUserModel john = SplitUserModel('John', Color(0xffB76868));
    eric.setSplit(-10);
    john.setSplit(10);

    model.users.add(eric);
    model.users.add(john);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return GuideScaffold(
      title: 'Done',
      last: true,
      counterText: '3 / 3',
      backButton: IconButton(
        icon: Icon(CustomIcons.back),
        onPressed: () {Get.back();},
        splashRadius: 20,
        iconSize: 30,
      ),
      onContinue: () async {
        UserModel user = Get.find();
        SplitUserModel createdUser = await Get.to(() => AddSplitUser.create());
        user.create(createdUser.name, createdUser.color);

        Get.until((route) => route.isFirst);
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
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
                      children: [SplitDoneRow(PaymentModel(model.users.first, model.users.last, 10)), SplitDoneRow.guide()],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        raisedButton(
                          text: 'Copy as text',
                          icon: CustomIcons.copy,
                          expand: true,
                          enabled: false,
                        ),
                        SizedBox(width: 25,),
                        raisedButton(
                          text: 'Share',
                          icon: CustomIcons.edit,
                          expand: true,
                          enabled: false,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'When all items have been added, tap the "solve" button. This will show all the payments needed to equally split the bill. The split can then be copied as plain text or shared as a picture.',
                style: theme.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
