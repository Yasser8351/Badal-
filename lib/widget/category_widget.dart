import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilits/app_ui_helpers.dart';

class CategoryWidget extends GetView<AddProductController> {
  const CategoryWidget({
    Key? key,
    required this.categoryModel,
    required this.index,
    required this.expandeIndex,
  }) : super(key: key);
  final CategoryModel categoryModel;
  final int index;
  final int expandeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: px10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: expandeIndex == index
                  ? kcPrimary
                  : kcAccentLight.withAlpha(150),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: MyText.h6(
              padding: EdgeInsetsDirectional.only(
                  start: px12, end: px12, top: 8, bottom: 8),
              categoryModel.name,
              fontSize: px20,
              color: expandeIndex == index ? Colors.white : kcPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
