import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/dialogs/custom_dialog.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class DeleteUserDialog extends StatelessWidget {

  Function(bool) callback;

  DeleteUserDialog({this.callback});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return CustomDialog(
      title: 'Are you sure?',
      icon: CustomIcons.trash,
      content: Text(
        'Deleting this user will remove all items where this user is the buyer, and will remove this user from all items where they\'re marked as a receiver. Are you sure?',
        style: theme.textTheme.bodyText1,
      ),
      acceptButton: 'Delete',
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
