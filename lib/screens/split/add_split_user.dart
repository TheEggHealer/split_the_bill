import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/controllers/split_controller.dart';
import 'package:split_the_bill/dialogs/color_picker_dialog.dart';
import 'package:split_the_bill/models/split_user_model.dart';
import 'package:split_the_bill/utils/color_utils.dart';
import 'package:split_the_bill/utils/custom_icons.dart';
import 'package:split_the_bill/utils/debugging.dart';
import 'package:split_the_bill/widgets/cards/user_color_preview_card.dart';
import 'package:split_the_bill/widgets/custom_input_fields.dart';
import 'package:split_the_bill/widgets/scaffolds/split_scaffold.dart';

class AddSplitUser extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  Rx<Color> _selectedColor;
  SplitController controller = Get.find();

  AddSplitUser() {
    _selectedColor = ColorUtils.randomUnique(controller.users.map((u) => u.color).toList()).obs;
  }

  void onDone() {
    SplitUserModel user = SplitUserModel(_nameController.text, _selectedColor.value);
    controller.addUser(user);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;

    return SplitScaffold(
      title: 'Add person',
      colorLight: Color(0xFFE9F7FF),
      colorDark: Color(0xFFC9EBFF),
      icon: SvgPicture.asset('assets/new_person.svg'),
      navButton: IconButton(
        icon: Icon(CustomIcons.back),
        onPressed: () => Get.back(),
        splashRadius: 20,
        iconSize: 30,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputField(
                title: 'Name',
                controller: _nameController,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 30),
              Text(
                'Color',
                style: theme.textTheme.headline2,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Obx(() => UserColorPreviewCard(_selectedColor.value)),
                  SizedBox(width: 10,),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(CustomIcons.color_picker),
                      onPressed: () {
                        Get.dialog(ColorPickerDialog(
                          currentColor: _selectedColor.value.obs,
                          onDone: (color) {
                            _selectedColor.value = color;
                          }
                        ));
                      },
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      fab: showFab ? FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 32,
          color: theme.backgroundColor,
        ),
        backgroundColor: theme.accentColor,
        onPressed: () {
          if(_formKey.currentState.validate()) {
            onDone();
          }
        },
      ) : null,
    );
  }
}
