import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/authentication/launch_screen.dart';
import 'package:split_the_bill/screens/split/main_split_screen.dart';

class ScreenWrapper extends StatelessWidget {

  final UserModel user = UserModel('Jonathan'.obs, Color(0xFFB76868).obs);

  @override
  Widget build(BuildContext context) {

    Get.put(user);

    return Obx(
      () => user.signedIn.value ? MainSplitScreen() : LaunchScreen(),
    );
    switch (user.signedIn.value) {
      case true: return MainSplitScreen();
      case false: return LaunchScreen();
    }
  }
}
