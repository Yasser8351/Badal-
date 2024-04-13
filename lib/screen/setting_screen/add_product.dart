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

import '../../controller/product_controller/add_product_controller.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController addProductController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.addProdcut.tr),
      ),
      body: GetBuilder<AddProductController>(
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
                                      list: addProductController.listCity,
                                      onChangedValueSelected: (value) =>
                                          addProductController
                                              .onChangedValueSelected(
                                                  value, DropdownType.city),
                                      valueDrowpDownSelected:
                                          addProductController.valueCity,
                                      hint: "المدينة"),
                                  horizontalSpaceMedium,
                                  if (addProductController.valueCity != null)
                                    DropdownWidget(
                                        list: addProductController.listState,
                                        onChangedValueSelected: (value) =>
                                            addProductController
                                                .onChangedValueSelected(
                                                    value, DropdownType.state),
                                        valueDrowpDownSelected:
                                            addProductController.valueState,
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
                                controller:
                                    addProductController.titleProductController,
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
                                  list: addProductController.listCategory,
                                  onChangedValueSelected: (value) =>
                                      addProductController
                                          .onChangedValueSelected(
                                              value, DropdownType.category),
                                  valueDrowpDownSelected:
                                      addProductController.valueCategory,
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
