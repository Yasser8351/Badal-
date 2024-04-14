import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/dropdown_widget.dart';
import 'package:badal/widget/shared_widgets/handling_data_view.dart';
import 'package:badal/widget/shared_widgets/image_app.dart';
import 'package:badal/widget/shared_widgets/my_button.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:badal/widget/shared_widgets/text_faild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoreOptionToProduct extends StatelessWidget {
  const AddMoreOptionToProduct({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionProductController =
        TextEditingController();
    TextEditingController priceProductController = TextEditingController();
    TextEditingController phoneProductController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.addProdcut.tr),
      ),
      body: GetBuilder<CategoryAndCityController>(
          builder: (controller) => SingleChildScrollView(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: px20, vertical: px10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceRegular,

                        /// add image
                        ContainerWithDecoration(
                          bottomLeft: px10,
                          bottomRight: px10,
                          topLeft: px10,
                          topRight: px10,
                          paddingRight: px16,
                          paddinLeft: px16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          child: Column(
                            children: [
                              verticalSpaceSmall,
                              ImageApp(
                                  image: AppImage.placeholder,
                                  color: kcPrimary,
                                  width: px32 * 2,
                                  height: px32 * 2),
                              MyText.h6(AppConfig.addPhoto.tr,
                                  fontSize: px18,
                                  padding: EdgeInsets.only(
                                      right: 15, left: 15, bottom: px10)),
                            ],
                          ),
                        ),
                        verticalSpaceRegular,

                        /// add location Prodcut
                        ContainerWithDecoration(
                          bottomLeft: px10,
                          bottomRight: px10,
                          topLeft: px10,
                          topRight: px10,
                          paddingRight: px16,
                          paddinLeft: px16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceSmall,
                              MyText.h6(AppConfig.locationProdcut.tr,
                                  fontSize: px18,
                                  padding: EdgeInsets.only(bottom: px10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownWidget(
                                      list: controller.listCity,
                                      onChangedValueSelected: (value) =>
                                          controller.onChangedValueSelected(
                                              value, DropdownType.city),
                                      valueDrowpDownSelected:
                                          controller.valueCity,
                                      hint: "المدينة"),
                                  horizontalSpaceMedium,
                                  if (controller.valueCity != null)
                                    DropdownWidget(
                                        list: controller.listState,
                                        onChangedValueSelected: (value) =>
                                            controller.onChangedValueSelected(
                                                value, DropdownType.state),
                                        valueDrowpDownSelected:
                                            controller.valueState,
                                        hint: "المحلية"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceRegular,

                        /// add title Prodcut
                        ContainerWithDecoration(
                          bottomLeft: px10,
                          bottomRight: px10,
                          topLeft: px10,
                          topRight: px10,
                          paddingRight: px16,
                          paddinLeft: px16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceSmall,
                              MyText.h6(AppConfig.titleProdcut.tr,
                                  fontSize: px18),
                              verticalSpaceSmall,
                              TextFaildInput(
                                controller: descriptionProductController,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kcGreyVeryLight),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kcGreyVeryLight),
                                ),
                                hint: "مثال: فستان زفاف",
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceRegular,

                        /// add Category
                        ContainerWithDecoration(
                          bottomLeft: px10,
                          bottomRight: px10,
                          topLeft: px10,
                          topRight: px10,
                          paddingRight: px16,
                          paddinLeft: px16,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceSmall,
                              MyText.h6(AppConfig.category.tr, fontSize: px18),
                              DropdownWidget(
                                  list: controller.listCategory,
                                  onChangedValueSelected: (value) =>
                                      controller.onChangedValueSelected(
                                          value, DropdownType.category),
                                  valueDrowpDownSelected:
                                      controller.valueCategory,
                                  hint: "كل الاقسام")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
      bottomNavigationBar: MyButton(
        text: AppConfig.next.tr,
        padding:
            EdgeInsetsDirectional.only(bottom: px50, start: px25, end: px25),
      ),
    );
  }
}
