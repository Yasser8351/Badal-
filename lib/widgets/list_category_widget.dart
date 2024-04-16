import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:get/get.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryAndCityController>(
      builder: (controller) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: px5),
            child: SizedBox(
              height: px50,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: px5),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listCategory.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.onChangedExpandexIndex(
                        index, ExpandeIndexType.category),
                    child: CategoryWidget(
                      categoryModel: controller.listCategory[index],
                      index: index,
                      expandeIndex: controller.expandeIndexCategory,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (controller.expandeIndexCategory != 0)
            Padding(
              padding: EdgeInsets.only(top: px5),
              child: SizedBox(
                height: px50,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: px5),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listSubCategory.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => controller.onChangedExpandexIndex(
                          index, ExpandeIndexType.subCategory),
                      child: CategoryWidget(
                        categoryModel: controller.listSubCategory[index],
                        index: index,
                        expandeIndex: controller.expandeIndexSubCategory,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
