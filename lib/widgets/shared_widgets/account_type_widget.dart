import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/widgets/shared_widgets/container_with_decoration.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';

class ProductStatusWidget extends StatelessWidget {
  const ProductStatusWidget(
      {super.key,
      required this.title,
      required this.description1,
      required this.description2,
      required this.status,
      required this.widgetType});
  final String title;
  final String description1;
  final String description2;
  final bool status;
  final WidgetType widgetType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
      builder: (controller) => Row(
        children: [
          MyText.h6(title, fontSize: px18),
          horizontalSpaceRegular,
          ContainerWithDecoration(
            onTap: () => controller.selectAccountType(true, widgetType),
            // color: widgetType == WidgetType.status
            //     ? status
            //         ? Colors.white
            //         : Colors.grey.shade200
            //     : controller.isBadal
            //         ? Colors.white
            //         : Colors.grey.shade200,
            color: status ? Colors.white : Colors.grey.shade200,
            bottomLeft: 5,
            bottomRight: 5,
            topLeft: 5,
            topRight: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: px32, vertical: px12),
              child: MyText.h6(description1,
                  color: status ? Colors.black : Colors.black,
                  fontSize: status ? px18 : px16),
            ),
          ),
          horizontalSpaceRegular,
          ContainerWithDecoration(
            onTap: () => controller.selectAccountType(false, widgetType),
            color: status ? Colors.grey.shade200 : Colors.white,
            bottomLeft: 5,
            bottomRight: 5,
            topLeft: 5,
            topRight: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: px32, vertical: px12),
              child: MyText.h6(description2,
                  fontSize: status ? px16 : px18,
                  color: status ? Colors.black : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
