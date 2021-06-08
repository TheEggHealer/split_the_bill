import 'package:get/get.dart';
import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';

class SplitController extends GetxController {

  Rx<SplitModel> _model = SplitModel().obs;

  SplitController(UserModel initialUser) {
    addUser(SplitUserModel(initialUser.name.value, initialUser.color.value, mainUser: true));
  }

  get model => _model.value;
  List<SplitUserModel> get users => _model.value.users;
  List<SplitItemModel> get items => _model.value.items;
  bool get canSplit => users.isNotEmpty && items.isNotEmpty && items.any((item) => !item.receivers.contains(users.first) || item.receivers.length > 1);

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

  void removeUser(SplitUserModel user) {
    items.forEach((item) {
      item.receivers.remove(user);
    });
    items.removeWhere((item) => item.buyer == user || item.receivers.isEmpty);

    users.remove(user);

    calculateSplit();
    refresh();
  }

  void addItem(SplitItemModel item) {
    _model.value.items.add(item);
    calculateSplit();
    refresh();
  }

  void removeItem(SplitItemModel item) {
    _model.value.items.remove(item);
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

  void reset() {
    items.clear();
    users.removeRange(1, users.length);

    calculateSplit();
    refresh();
  }


}