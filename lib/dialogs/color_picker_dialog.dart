import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/dialogs/custom_dialog.dart';
import 'package:split_the_bill/utils/custom_icons.dart';

class ColorPickerDialog extends StatelessWidget {

  Rx<Color> currentColor;
  Function(Color color) onDone;

  ColorPickerDialog({this.currentColor, this.onDone});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return CustomDialog(
      title: 'Pick a color',
      icon: CustomIcons.color_picker,
      content: Obx(() =>
        ColorPicker(
          enableAlpha: false,
          labelTextStyle: theme.textTheme.bodyText1,
          pickerColor: currentColor.value,
          onColorChanged: (color) {
            //currentColor.update((val) => color);
            currentColor.value = color;
          },
          showLabel: false,
          pickerAreaHeightPercent: 0.8,
        ),
      ),
      acceptButton: 'Done',
      denyButton: 'Cancel',
      onAccept: () {
        Get.back();
        onDone(currentColor.value);
      },
      onDeny: () {
        Get.back();
      },
    );
  }
}
