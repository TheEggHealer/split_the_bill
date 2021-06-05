import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/authentication/launch_screen.dart';
import 'package:split_the_bill/screens/split/main_split_screen.dart';
import 'package:split_the_bill/utils/debugging.dart';

class ScreenWrapper extends StatelessWidget {

  UserModel _user;

  void getUserFromStorage(UserModel user) {
    if(GetStorage().read('userName') != null && GetStorage().read('userColor') != null) {
      String name = GetStorage().read('userName');
      Color color = Color(GetStorage().read('userColor'));
      user.create(name, color);
    }
  }

  @override
  Widget build(BuildContext context) {

    debug('reloading');

    return GetBuilder<UserModel>(
      init: UserModel('initial'.obs, Colors.black.obs, created: false.obs),
      builder: (user) {
        Get.put(user);
        getUserFromStorage(user);

        return user.created.value ? MainSplitScreen() : LaunchScreen();
      },
    );
  }
}
