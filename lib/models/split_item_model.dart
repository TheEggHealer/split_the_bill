import 'package:split_the_bill/models/split_user_model.dart';

class SplitItemModel {

  String _itemName = '';
  int _itemCost = 0;
  SplitUserModel _buyer;
  List<SplitUserModel> _receivers = [];

  String get itemName => _itemName;
  int get itemCost => _itemCost;
  SplitUserModel get buyer => _buyer;
  List<SplitUserModel> get receivers => _receivers;

  void setItemName(String itemName) {
    this._itemName = itemName;
  }

  void setItemCost(int itemCost) {
    this._itemCost = itemCost;
  }

  void setBuyer(SplitUserModel buyer) {
    this._buyer = buyer;
  }

  void setReceivers(List<SplitUserModel> receivers) {
    this._receivers = receivers;
  }

}