

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel {

  var signedIn = false.obs;
  var hasAccount = false.obs;
  var name = ''.obs;
  Rx<Color> color;

  UserModel(this.name, this.color, {this.hasAccount});

}