import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/widgets/custom_buttons.dart';

class CustomDialog extends StatelessWidget {

  IconData icon;
  String title;
  Widget content;

  String acceptButton = '';
  String denyButton = '';
  Function onAccept;
  Function onDeny;

  CustomDialog({this.icon, this.title, this.content, this.acceptButton, this.denyButton, this.onAccept, this.onDeny});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return Dialog(
      backgroundColor: theme.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: theme.primaryColor,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: theme.textTheme.headline2,
                  )
                ],
              ),
              SizedBox(height: 10),
              content,
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  raisedButton(
                    text: denyButton,
                    icon: Icons.close,
                    onTap: onDeny,
                    color: theme.errorColor
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  raisedButton(
                    text: acceptButton,
                    icon: Icons.done,
                    onTap: onAccept,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
