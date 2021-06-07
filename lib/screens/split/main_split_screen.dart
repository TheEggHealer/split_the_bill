import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/controllers/split_controller.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/split/add_split_item.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/screens/split/split_done_screen.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/cards/split_item_card.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';

class MainSplitScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    UserModel user = Get.find();

    SplitController controller = Get.put(SplitController(user));

    return GetBuilder<SplitController>(
      init: controller,
      //initState: (c) {
      //  controller.users.add(SplitUserModel.random('Jonathan', controller.model));
      //  debug(controller.users);
      //},
      builder: (controller) {

        List<SplitUserCard> _userCards = List<SplitUserCard>.from(controller.users.map((u) => SplitUserCard(u, editable: true,)));
        List<SplitItemCard> _itemCards = List<SplitItemCard>.from(controller.items.map((i) => SplitItemCard(i)));

        return SplitScaffold(
          title: 'Split the bill',
          colorDark: Color(0xFFFFF3C9),
          colorLight: Color(0xFFFFFCE3),
          icon: SvgPicture.asset('assets/split_dollar.svg'),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                GradientCard(
                  colorTop: theme.cardColor,
                  colorBottom: Color(0xFFEEFFE7),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          children: _userCards,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              raisedButton(
                                text: 'Add member',
                                icon: Icons.add,
                                expand: true,
                                onTap: () {
                                  Get.to(() => AddSplitUser());
                                },
                              ),
                              SizedBox(width: 25,),
                              raisedButton(
                                text: 'Solve split',
                                icon: Icons.done,
                                expand: true,
                                enabled: controller.canSplit,
                                onTap: () {
                                  Get.to(() => SplitDoneScreen());
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: _itemCards,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          fab: FloatingActionButton(
            heroTag: 'done',
            child: Icon(
              Icons.add,
              size: 32,
              color: theme.backgroundColor,
            ),
            backgroundColor: theme.accentColor,
            onPressed: () {
              Get.to(() => AddSplitItem());
            },
          ),
        );
      },
    );
  }
}
