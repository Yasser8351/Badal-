import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_button.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//           class FeesAgrment extends GetView<CategoryAndCityController> {

class FeesAgrment extends StatelessWidget {
  const FeesAgrment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.feesAgrment.tr),
      ),
      body: Card(
        child: GetBuilder<CategoryAndCityController>(builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.valueCheckboxAgremnt,
                    onChanged: (value) {
                      controller.onChangedValueCheckboxAgremnt(value ?? false);
                    },
                  ),
                  MyText.h6("* ${AppConfig.acceptFeesAgrment.tr}"),
                ],
              ),

              /// Send Data
              MyButton(
                // onTap: () => Get.to(() => const FeesAgrment()),
                disable: !controller.valueCheckboxAgremnt,
                text: AppConfig.next.tr,
                padding: EdgeInsetsDirectional.only(
                    bottom: px50, start: px25, end: px25),
              ),
            ],
          );
        }),
      ),
    );
  }
}
