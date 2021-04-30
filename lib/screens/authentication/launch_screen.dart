import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/split/main_split_screen.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/auth_scaffold.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserModel user = Get.find<UserModel>();
    print(user.signedIn);

    return AuthScaffold(
      icon: SvgPicture.asset(
          'assets/logo.svg'
      ),
      title: 'Split the bill',
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                authButton(
                  text: 'Continue without account',
                  onTap: () {
                    user.signedIn.value = true;
                    Get.off(MainSplitScreen());
                  },
                ),
                SizedBox(height: 15),
                authButton(
                  text: 'Sign in',
                  onTap: () {},
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don\'t have an account? '
                        ),
                        TextSpan(
                            text: 'Register new account!',
                            style: Get.textTheme.bodyText2.apply(decoration: TextDecoration.underline)
                        ),
                      ],
                      style: Get.textTheme.bodyText2
                  ),
                ),
              ],
            ),
          ]
        )
      ),
    );
  }
}
