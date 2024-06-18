import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/widgets/shared_widgets/container_with_decoration.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';

class ProductStatusWidget extends StatelessWidget {
  const ProductStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
      builder: (controller) => Row(
        children: [
          MyText.h6("الحالة", fontSize: px18),
          horizontalSpaceRegular,
          ContainerWithDecoration(
            onTap: () => controller.selectAccountType(true),
            color: controller.isNew ? kcPrimary : Colors.grey.shade200,
            bottomLeft: 5,
            bottomRight: 5,
            topLeft: 5,
            topRight: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: px32, vertical: px12),
              child: MyText.h6(AppConfig.newProduct.tr,
                  color: controller.isNew ? Colors.white : kcPrimary,
                  fontSize: controller.isNew ? px18 : px16),
            ),
          ),
          horizontalSpaceRegular,
          ContainerWithDecoration(
            onTap: () => controller.selectAccountType(false),
            color: controller.isNew ? Colors.grey.shade200 : kcPrimary,
            bottomLeft: 5,
            bottomRight: 5,
            topLeft: 5,
            topRight: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: px32, vertical: px12),
              child: MyText.h6(AppConfig.used.tr,
                  fontSize: controller.isNew ? px16 : px18,
                  color: controller.isNew ? kcPrimary : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
