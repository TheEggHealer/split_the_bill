import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/utils/color_utils.dart';
import 'package:split_the_bill/utils/debugging.dart';


class SplitUserModel {


  static RandomColor _randomColor = RandomColor();

  bool mainUser;
  String _name = '';
  Color _color;
  double _split = 0;
  UserModel _linkedUser;

  SplitUserModel(this._name, this._color, {this.mainUser = false});

  SplitUserModel.random(this._name, SplitModel splitModel) {
    _color = ColorUtils.randomUnique(splitModel.users.map((u) => u.color).toList());
  }

  SplitUserModel.clone(SplitUserModel model) {
    this._name = model._name;
    this._color = model._color;
    this._split = model._split;
    this._linkedUser = model._linkedUser;
  }

  String get name => _name;
  Color get color => _color;
  double get split => _split;
  UserModel get linkedUser => _linkedUser;

  void addSplit(double amount) {
    _split += amount;
    if(_split.abs() <= 0.1) _split = 0;
  }

  void subtractSplit(double amount) {
    _split -= amount;
    if(_split.abs() <= 0.1) _split = 0;
  }

  void setSplit(double amount) {
    _split = amount;
  }

  void linkUser(UserModel user) {
    _linkedUser = user;
    debug('Linked user: $user');
  }

  void setName(String name) {
    this._name = name;
  }

  void setColor(Color color) {
    this._color = color;
  }

}

String signedString(double value, {bool withPlus = true}) {
  String out = '${value > 0 && withPlus ? '+' : ''}${value.toStringAsFixed(1)}';
  if(out.endsWith('.0')) out = out.replaceAll('.0', '');
  return out;
}