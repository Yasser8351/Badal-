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
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: px100 * 2.2,
              child: Padding(
                padding: EdgeInsets.only(top: px10),
                child: SizedBox(
                  // height: px100,
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: px5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 135.0,
                            ),
                            padding: EdgeInsets.zero,
                            // scrollDirection: Axis.horizontal,
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
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 135.0,
                            ),
                            padding: EdgeInsets.zero,
                            // scrollDirection: Axis.horizontal,
                            itemCount: controller.listCategory2.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => controller.onChangedExpandexIndex(
                                  index, ExpandeIndexType.category),
                              child: CategoryWidget(
                                categoryModel: controller.listCategory2[index],
                                index: index,
                                expandeIndex: controller.expandeIndexCategory,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /*
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
        */
          ],
        ),
      ),
    );
  }
}
