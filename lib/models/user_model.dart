

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel extends GetxController {

  var signedIn = false.obs;
  var hasAccount = false.obs;
  var name = ''.obs;
  var created = false.obs;
  Rx<Color> color;

  UserModel(this.name, this.color, {this.hasAccount, this.created});

  void create(String name, Color color) {
    this.name = name.obs;
    this.color = color.obs;
    this.created = true.obs;
    refresh();
  }

}