import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:badal/widget/shared_widgets/text_faild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormWithSwithButton extends StatelessWidget {
  const TextFormWithSwithButton(
      {super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.height * .35,
          child: TextFaildInput(
            controller: controller,
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
                  value: true,
                  activeColor: kcPrimary,
                  onChanged: (value) {},
                ),
              ),
      ],
    );
  }
}
