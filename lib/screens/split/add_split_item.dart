import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/controllers/split_controller.dart';
import 'package:split_the_bill/models/split_item_model.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/widgets/cards/user_radio_card.dart';
import 'package:split_the_bill/widgets/cards/user_toggle_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/custom_input_fields.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';

class AddSplitItem extends StatelessWidget {

  bool editing;
  SplitItemModel editingModel;

  final GlobalKey<FormState> _formKey = GlobalKey();

  var selectedBuyer = 0.obs;
  List<UserRadioCard> _buyerList;
  List<UserToggleCard> _receiverList;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _costController = TextEditingController();


  AddSplitItem() {
    editing = false;

    SplitController controller = Get.find();

    selectedBuyer = (controller.items.isNotEmpty ? controller.users.indexOf(controller.items.last.buyer) : 0).obs;
    int buyerValue = 0;
    _buyerList = List<UserRadioCard>.from(controller.users.map((u) => UserRadioCard(u, buyerValue++, selectedBuyer, (value) => selectedBuyer.value = value)));

    _receiverList = List<UserToggleCard>.from(controller.users.map((u) {
      return UserToggleCard(u, false.obs);
    }));
  }

  AddSplitItem.edit(SplitItemModel model) {
    editing = true;
    editingModel = model;

    SplitController controller = Get.find();

    selectedBuyer = controller.users.indexOf(model.buyer).obs;

    int buyerValue = 0;
    _buyerList = List<UserRadioCard>.from(controller.users.map((u) => UserRadioCard(u, buyerValue++, selectedBuyer, (value) => selectedBuyer.value = value)));

    _receiverList = List<UserToggleCard>.from(controller.users.map((u) {
      return UserToggleCard(u, model.receivers.contains(u).obs);
    }));

    _titleController.text = model.itemName;
    _costController.text = '${model.itemCost}';
  }

  List<bool> getSelectedReceivers(List<UserToggleCard> cards) {
    return cards.map((c) => c.value).toList();
  }

  void onCreate() {
    SplitController controller = Get.find();

    SplitItemModel item = SplitItemModel();
    item.setBuyer(controller.users[selectedBuyer.value]);

    int index = 0;
    List<bool> selectedReceivers = getSelectedReceivers(_receiverList);
    item.setReceivers(controller.users.where((user) => selectedReceivers[index++]).toList());

    item.setItemCost(double.parse(_costController.text.trim()));
    item.setItemName(_titleController.text.trim().isEmpty ? 'Item ${controller.items.length + 1}' : _titleController.text.trim());

    controller.addItem(item);
    Get.back();
  }

  void onEdit() {
    SplitController controller = Get.find();

    editingModel.setBuyer(controller.users[selectedBuyer.value]);

    int index = 0;
    List<bool> selectedReceivers = getSelectedReceivers(_receiverList);
    editingModel.setReceivers(controller.users.where((user) => selectedReceivers[index++]).toList());

    editingModel.setItemCost(double.parse(_costController.text));
    editingModel.setItemName(_titleController.text.isEmpty ? 'Item ${controller.items.length + 1}' : _titleController.text);

    controller.calculateSplit();
    controller.update();
    Get.back();
  }

  void onDelete() {
    SplitController controller = Get.find();

    controller.removeItem(editingModel);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    SplitController controller = Get.find();
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;

    return SplitScaffold(
      title: editing ? 'Edit item' : 'Add item',
      colorDark: Color(0xFFFFC9C9),
      colorLight: Color(0xFFFFE3E3),
      icon: SvgPicture.asset('assets/price_tag.svg'),
      navButton: IconButton(
        icon: Icon(CustomIcons.back),
        onPressed: () => Get.back(),
        splashRadius: 20,
        iconSize: 30,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputField(
                title: 'Item',
                hint: 'Item ${controller.items.length + 1}',
                controller: _titleController,
                validator: (val) => null,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 150,
                child: inputField(
                  title: 'Cost',
                  controller: _costController,
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  validator: (val) => val.isEmpty || double.tryParse(val) == null ? 'Enter valid number' : null,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Buyer',
                style: theme.textTheme.headline2,
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: _buyerList,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Receiver(s)',
                    style: theme.textTheme.headline2,
                  ),
                  raisedButton(
                    text: 'Toggle all',
                    onTap: () {
                      if(getSelectedReceivers(_receiverList).any((e) => !e)) _receiverList.forEach((user) {user.setValue(true);});
                      else _receiverList.forEach((user) {user.setValue(false);});
                    }
                  )
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: _receiverList,
                ),
              ),
              SizedBox(height: 5),
              Obx(
                () => AnimatedOpacity(
                  opacity: getSelectedReceivers(_receiverList).any((selected) => selected) ? 0 : 1,
                  duration: Duration(milliseconds: 80),
                  child: Text(
                    'Please select at least one receiver',
                    style: theme.textTheme.bodyText2.apply(color: theme.errorColor),
                  ),
                ),
              ),
              SizedBox(height: 260),
            ],
          ),
        ),
      ),
      fab: showFab ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if(editing) FloatingActionButton(
            child: Icon(
              CustomIcons.trash,
              size: 32,
              color: theme.backgroundColor,
            ),
            backgroundColor: theme.errorColor,
            onPressed: () {
              onDelete();
            },
          ),
          Spacer(
            flex: 1,
          ),
          FloatingActionButton(
            heroTag: 'done',
            child: Icon(
              Icons.done,
              size: 32,
              color: theme.backgroundColor,
            ),
            backgroundColor: theme.accentColor,
            onPressed: () {
              if(_formKey.currentState.validate() && getSelectedReceivers(_receiverList).any((selected) => selected)) {
                if(editing) onEdit();
                else onCreate();
              }
            },
          ),
        ]
      ) : null,
    );
  }
}
