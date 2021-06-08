import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/dialogs/custom_dialog.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class ResetConfirmationDialog extends StatelessWidget {

  final Function(bool) callback;

  ResetConfirmationDialog({this.callback});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return CustomDialog(
      icon: CustomIcons.sign_in,
      title: 'Reset split',
      content: Text(
        'Resetting the split will remove all items and users except you. Are you sure?',
        style: theme.textTheme.bodyText1,
      ),
      acceptButton: 'Confirm',
      denyButton: 'Cancel',
      onAccept: () {
        callback(true);
        Get.back();
      },
      onDeny: () {
        callback(false);
        Get.back();
      },
    );
  }
}
