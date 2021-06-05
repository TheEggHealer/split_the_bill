import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:split_the_bill/screens/authentication/launch_screen.dart';
import 'package:split_the_bill/screens/screen_wrapper.dart';
import 'package:split_the_bill/screens/split/main_split_screen.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/utils/themes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(Main());
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Split the bill',
      theme: lightTheme,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    return ScreenWrapper();
  }

}
