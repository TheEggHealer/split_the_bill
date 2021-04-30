import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/utils/color_utils.dart';
import 'package:split_the_bill/utils/debugging.dart';


class SplitUserModel {

  static RandomColor _randomColor = RandomColor();

  String _name = '';
  Color _color;
  int _difference = 0;
  UserModel _linkedUser;

  SplitUserModel(this._name, SplitModel splitModel) {
    _color = ColorUtils.randomUnique(splitModel.users.map((u) => u.color).toList());
  }

  String get name => _name;
  Color get color => _color;
  int get difference => _difference;
  UserModel get linkedUser => _linkedUser;

  void addDifference(int amount) {
    _difference += amount;
  }

  void subtractDifference(int amount) {
    _difference -= amount;
  }

  void linkUser(UserModel user) {
    _linkedUser = user;
    debug('Linked user: $user');
  }

}