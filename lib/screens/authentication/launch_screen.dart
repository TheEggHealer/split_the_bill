import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/guide/guide_people_screen.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/screens/split/main_split_screen.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/auth_scaffold.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserModel user = Get.find();
    //print(user.signedIn);

    return AuthScaffold(
      icon: SvgPicture.asset(
        'assets/logo.svg',
      ),
      title: 'Split the bill',
      body: Container(
        child: authButton(
          text: 'Continue',
          onTap: () async {
            await Get.to(() => GuidePeopleScreen());
            //SplitUserModel createdUser = await Get.to(() => AddSplitUser.create());
            //user.create(createdUser.name, createdUser.color);
            //debug(user.created);
          },
        )
      ),
    );
  }
}
