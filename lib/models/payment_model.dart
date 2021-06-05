import 'package:split_the_bill/models/split_user_model.dart';

class PaymentModel {

  SplitUserModel sender;
  SplitUserModel receiver;
  double amount;

  PaymentModel(this.sender, this.receiver, this.amount);

}