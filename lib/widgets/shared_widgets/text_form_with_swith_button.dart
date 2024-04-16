import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:badal/widgets/shared_widgets/text_faild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormWithSwithButton extends GetView<CategoryAndCityController> {
// class TextFormWithSwithButton extends StatelessWidget {
  //GetView<CategoryAndCityController>
  const TextFormWithSwithButton(
      {super.key,
      required this.textEditingController,
      required this.hint,
      this.valueSwitch});
  final TextEditingController textEditingController;
  final String hint;
  final bool? valueSwitch;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.height * .35,
          child: TextFaildInput(
            controller: textEditingController,
            inputType: TextInputType.number,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kcGreyVeryLight),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kcGreyVeryLight),
            ),
            hint: hint,
          ),
        ),
        hint.contains(AppConfig.price.tr)
            ? SizedBox(
                width: px25,
                child: MyText.h6(AppConfig.curancy.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: px20,
                    color: kcPrimary),
              )
            : SizedBox(
                width: px25,
                child: Switch(
                  value: controller.valueSwitch,
                  activeColor: kcPrimary,
                  onChanged: (value) {
                    controller.onChangedValueSwitch(value);
                  },
                ),
              ),
      ],
    );
  }
}
