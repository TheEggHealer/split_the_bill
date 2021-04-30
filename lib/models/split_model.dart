import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';

class SplitModel {

  List<SplitUserModel> _users = [];
  List<SplitItemModel> _items = [];

  List<SplitUserModel> get users => _users;
  List<SplitItemModel> get items => _items;

  void setUsers(List<SplitUserModel> users) {
    this._users = users;
  }

  void setItems(List<SplitItemModel> items) {
    this._items = items;
  }

  void addUser(SplitUserModel user) {
    _users.add(user);
  }

  void addItem(SplitItemModel item) {
    _items.add(item);
  }


}