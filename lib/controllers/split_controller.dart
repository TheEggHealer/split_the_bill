import 'package:get/get.dart';
import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';

class SplitController extends GetxController {

  Rx<SplitModel> _model = SplitModel().obs;

  SplitController(UserModel initialUser) {
    addUser(SplitUserModel(initialUser.name.value, initialUser.color.value));
  }

  get model => _model.value;
  List<SplitUserModel> get users => _model.value.users;
  List<SplitItemModel> get items => _model.value.items;

  void setUsers(List<SplitUserModel> users) {
    _model.value.users = users;
    refresh();
  }

  void setItems(List<SplitItemModel> items) {
    _model.value.items = items;
    refresh();
  }

  void addUser(SplitUserModel user) {
    _model.value.users.add(user);
    refresh();
  }

  void addItem(SplitItemModel item) {
    _model.value.items.add(item);
    calculateSplit();
    refresh();
  }

  void calculateSplit() {
    _model.value.users.forEach((user) => user.setSplit(0));
    _model.value.items.forEach((item) {
      item.buyer.subtractSplit(item.itemCost);
      item.receivers.forEach((user) => user.addSplit(item.splitValue));
    });
  }

}