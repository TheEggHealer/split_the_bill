import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';

class MainSplitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserModel user = Get.find();

    return SplitScaffold(
      title: 'Split the bill',
      colorDark: Color(0xFFFFF3C9),
      colorLight: Color(0xFFFFFCE3),
      icon: SvgPicture.asset('assets/split_dollar.svg'),
      body: Center(
        child: SvgPicture.asset('assets/devyne_banner.svg'),
      ),
    );
  }
}
