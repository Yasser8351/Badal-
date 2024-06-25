import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/screen/fees_agrment/fees_agrment.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/account_type_widget.dart';
import 'package:badal/widgets/shared_widgets/dropdown_widget.dart';
import 'package:badal/widgets/shared_widgets/container_with_decoration.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:badal/widgets/shared_widgets/my_button.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:badal/widgets/shared_widgets/text_faild_input.dart';
import 'package:badal/widgets/shared_widgets/text_form_with_swith_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleProductController = TextEditingController();
    TextEditingController descriptionProductController =
        TextEditingController();
    TextEditingController priceProductController = TextEditingController();
    TextEditingController phoneProductController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: px50,
        backgroundColor: Colors.white,
        title: MyText.h6(AppConfig.addProdcut.tr, color: Colors.black),
      ),
      body: GetBuilder<CategoryAndCityController>(
        builder: (controller) => SingleChildScrollView(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: px20, vertical: px10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// add image
                  verticalSpaceRegular,
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
                        MyImageApp(
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

                  /// add location Prodcut
                  verticalSpaceRegular,
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
                                valueDrowpDownSelected: controller.valueCity,
                                hint: "المدينة"),
                            horizontalSpaceMedium,
                            if (controller.valueCity != null)
                              DropdownWidget(
                                  list: controller.listState,
                                  onChangedValueSelected: (value) =>
                                      controller.onChangedValueSelected(
                                          value, DropdownType.state),
                                  valueDrowpDownSelected: controller.valueState,
                                  hint: "المحلية"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// add title Prodcut
                  verticalSpaceRegular,
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
                        MyText.h6(AppConfig.titleProdcut.tr, fontSize: px18),
                        verticalSpaceSmall,
                        TextFaildInput(
                          controller: titleProductController,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kcGreyVeryLight),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kcGreyVeryLight),
                          ),
                          hint: "مثال: فستان زفاف",
                        ),
                      ],
                    ),
                  ),

                  /// add descroption
                  verticalSpaceRegular,
                  TextFaildInput(
                    controller: descriptionProductController,
                    maxLines: 3,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcGreyVeryLight),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcGreyVeryLight),
                    ),
                    hint: AppConfig.descroption.tr,
                  ),

                  /// add Category
                  verticalSpaceRegular,

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
                        MyText.h6(AppConfig.category.tr,
                            fontSize: px18,
                            padding: EdgeInsets.only(bottom: px10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownWidget(
                                list: controller.listCategory,
                                onChangedValueSelected: (value) =>
                                    controller.onChangedValueSelected(
                                        value, DropdownType.category),
                                valueDrowpDownSelected:
                                    controller.valueCategory,
                                hint: AppConfig.category.tr),
                            horizontalSpaceMedium,
                            if (controller.valueCategory != null)
                              DropdownWidget(
                                  list: controller.listSubCategory,
                                  onChangedValueSelected: (value) =>
                                      controller.onChangedValueSelected(
                                          value, DropdownType.subCategory),
                                  valueDrowpDownSelected:
                                      controller.valueSubCategory,
                                  hint: AppConfig.subCategory.tr),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// add Product Status
                  verticalSpaceRegular,

                  GetBuilder<AddProductController>(
                      builder: (controller) => ProductStatusWidget(
                            title: "الحالة",
                            description1: AppConfig.newProduct.tr,
                            description2: AppConfig.used.tr,
                            widgetType: WidgetType.status,
                            status: controller.isNew,
                          )),
                  verticalSpaceRegular,
                  GetBuilder<AddProductController>(
                      builder: (controller) => ProductStatusWidget(
                            title: "الخصائص",
                            description1: "للبيع",
                            description2: "للبدل",
                            status: controller.isBadal,
                            widgetType: WidgetType.type,
                          )),

/*
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
                            valueDrowpDownSelected: controller.valueCategory,
                            hint: AppConfig.category.tr),
                      ],
                    ),
                  ),
                      */
                  /// add price
                  verticalSpaceRegular,
                  TextFormWithSwithButton(
                      textEditingController: priceProductController,
                      hint: AppConfig.price.tr),

                  /// add phone
                  verticalSpaceRegular,

                  TextFormWithSwithButton(
                      textEditingController: phoneProductController,
                      hint: AppConfig.phone.tr),
                  MyText.h6(
                    AppConfig.hidePhoneHint.tr,
                    color: kcPrimary,
                    padding: EdgeInsetsDirectional.only(top: px14),
                  ),
                  verticalSpaceRegular,

                  /// add image
                  verticalSpaceRegular,
                  ContainerWithDecoration(
                      bottomLeft: px10,
                      bottomRight: px10,
                      topLeft: px10,
                      topRight: px10,
                      paddingRight: px16,
                      paddinLeft: px16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      child: Center(
                        child: Column(
                          children: [
                            verticalSpaceSmall,
                            MyImageApp(
                                image: AppImage.placeholder,
                                color: kcPrimary,
                                width: px32 * 2,
                                height: px32 * 2),
                            MyText.h6(AppConfig.addVideo.tr,
                                fontSize: px18,
                                padding: EdgeInsets.only(
                                    right: 15, left: 15, bottom: px10)),
                          ],
                        ),
                      )),
                  verticalSpaceSemiLarge,

                  /// Next Page
                  MyButton(
                    // onTap: () => Get.to(() => const FeesAgrment()),
                    text: "نشر العرض",
                    color: Colors.white,
                    textColorButton: Colors.black,
                    padding: EdgeInsetsDirectional.only(
                        bottom: px50, start: px25, end: px25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
