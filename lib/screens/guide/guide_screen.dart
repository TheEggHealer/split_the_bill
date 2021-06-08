import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/models/user_model.dart';
import 'package:split_the_bill/screens/guide/guide_done_screen.dart';
import 'package:split_the_bill/screens/guide/guide_items_screen.dart';
import 'package:split_the_bill/screens/guide/guide_people_screen.dart';
import 'package:split_the_bill/screens/split/add_split_user.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';
import 'package:split_the_bill/widgets/scaffolds/guide_scaffold.dart';

class GuideScreen extends StatelessWidget {

  Rx<PageController> _pageController;
  Rx<int> page = 0.obs;

  GuideScreen() {
    _pageController = PageController(initialPage: 0).obs;
  }

  void onDone() async {
    UserModel user = Get.find();
    SplitUserModel createdUser = await Get.to(() => AddSplitUser.create());
    user.create(createdUser.name, createdUser.color);

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    List<Widget> items = [
      GuidePeopleScreen(),
      GuideItemsScreen(),
      GuideDoneScreen(),
    ];

    return GuideScaffold(
      backButton: IconButton(
        icon: Icon(CustomIcons.back),
        onPressed: () {
          if(page.value > 0) _pageController.value.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          else Get.back();
        },
        splashRadius: 20,
        iconSize: 30,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(() => Container(
              width: Get.width,
              height: Get.height * 0.62,
              child: PageView(
                children: items,
                controller: _pageController.value,
                onPageChanged: (p) => page.value = p,
              ),
            )),
            SizedBox(height: 5),
            Obx(() => SmoothPageIndicator(
              controller: _pageController.value,
              count: items.length,
              effect: ScrollingDotsEffect(
                radius: 4,
                dotHeight: 6,
                dotWidth: 6,
                activeDotColor: theme.accentColor,
                dotColor: theme.disabledColor,
                activeDotScale: 1.5,
                maxVisibleDots: 5,
                spacing: 8,
              ),
            )),
            Obx(() => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    authButton(
                      text: page.value == 2 ? 'Continue' : 'Next',
                      onTap: () {
                        if(page.value < 2) _pageController.value.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        else {
                          onDone();
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      opacity: page.value == 2 ? 0 : 1,
                      child: raisedButton(
                        text: 'Skip',
                        icon: CustomIcons.arrow,
                        onTap: () {
                          if(page.value < 2) onDone();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
