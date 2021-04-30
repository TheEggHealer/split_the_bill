import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/split_model.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/utils/color_utils.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/cards/split_user_card.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';

class MainSplitScreen extends StatelessWidget {

  SplitModel _model = SplitModel();
  List<SplitUserCard> _userCards = [];

  MainSplitScreen() {
    _model.addUser(SplitUserModel('Jonathan', _model));
    _model.addUser(SplitUserModel('Simon', _model));
    _model.addUser(SplitUserModel('Anton', _model));
    _model.addUser(SplitUserModel('Jonte', _model));
    _model.addUser(SplitUserModel('Isak', _model));

  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    UserModel user = Get.find();

    _userCards = _model.users.map((u) => SplitUserCard(u)).toList();

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
              colorBottom: Color(0xFFFFFBEB),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: _userCards,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
