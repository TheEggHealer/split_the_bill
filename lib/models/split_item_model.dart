import 'package:split_the_bill/models/split_user_model.dart';

class SplitItemModel {

  String _itemName = '';
  double _itemCost = 0;
  SplitUserModel _buyer;
  List<SplitUserModel> _receivers = [];

  String get itemName => _itemName;
  double get itemCost => _itemCost;
  double get splitValue => _itemCost / receivers.length;
  SplitUserModel get buyer => _buyer;
  List<SplitUserModel> get receivers => _receivers;

  SplitItemModel setItemName(String itemName) {
    this._itemName = itemName;
    return this;
  }

  SplitItemModel setItemCost(double itemCost) {
    this._itemCost = itemCost;
    return this;
  }

  SplitItemModel setBuyer(SplitUserModel buyer) {
    this._buyer = buyer;
    return this;
  }

  SplitItemModel setReceivers(List<SplitUserModel> receivers) {
    this._receivers = receivers;
    return this;
  }

}