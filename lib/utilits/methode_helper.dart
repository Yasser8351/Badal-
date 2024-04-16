import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/category_widget.dart';
import 'package:badal/widgets/shared_widgets/my_button.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

handlingPaginationLoading(
    {required int length,
    required int totalCount,
    double? paddingstart,
    bool isTotalCount0 = false}) {
  return length == totalCount
      ? const SizedBox()
      : isTotalCount0
          ? const SizedBox()
          : Padding(
              padding:
                  EdgeInsetsDirectional.only(top: 0, start: paddingstart ?? 0),
              child: const Center(
                  child: CircularProgressIndicator(strokeWidth: .9)),
            );
}

handlingCatchError({
  required Object error,
  required Function() changeLoadingState,
  // Function()? tryAgain,
  required Function(String message) errorMessageUpdate,
}) {
  changeLoadingState();

  if (error.toString().contains("SocketException")) {
    errorMessageUpdate(AppConfig.noInternet.tr);
  } else if (error.toString().contains("TimeoutException") ||
      error.toString().contains("connection timeout") ||
      error.toString().contains("timeout")) {
    errorMessageUpdate(AppConfig.timeOut.tr);
  } else if (error is DioException) {
    // if (error.response != null) {
    // }
    // errorMessageUpdate(error.message.toString());
    errorMessageUpdate(error.response!.data['message']);
  } else {
    errorMessageUpdate(AppConfig.somthimgWroing.tr);
  }
}

handlingCatchError2(DioException error) {
  switch (error.type) {
    case DioExceptionType.sendTimeout:
      return "";
    case DioExceptionType.connectionTimeout:
      return "";
    case DioExceptionType.connectionError:
      return "";
    case DioExceptionType.receiveTimeout:
      return "";

    default:
      return "";
  }
}

///////////// methode helper /////////////

bool isLoadingButton(LoadingState loadingState) {
  if (loadingState == LoadingState.loading) {
    return true;
  } else {
    return false;
  }
}

dialogSearchFilter() {
  Get.bottomSheet(
    GetBuilder<CategoryAndCityController>(
      builder: (controller) => Container(
        height: Get.height * .36,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => controller.onChangedExpandexIndex(
                      -1, ExpandeIndexType.clearAllFilter),
                  child: MyText.h6(
                      controller.expandeIndexFilterSearch == -1 &&
                              controller.expandeIndexlistFilterWithLocation ==
                                  -1
                          ? "        "
                          : "مسح الكل",
                      fontSize: px20,
                      padding: EdgeInsetsDirectional.only(start: px25)),
                ),
                MyText.h6(
                  "تصفية البحث",
                  fontSize: px20,
                ),
                IconButton(
                    icon: const Icon(Icons.close), onPressed: () => Get.back()),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: px20),
              child: SizedBox(
                height: px50,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: px5),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listSearchFilter.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => controller.onChangedExpandexIndex(
                          index, ExpandeIndexType.filterSearch),
                      child: CategoryWidget(
                        categoryModel: controller.listSearchFilter[index],
                        index: index,
                        expandeIndex: controller.expandeIndexFilterSearch,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: px10),
              child: SizedBox(
                height: px50,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: px5),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listFilterWithLocation.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => controller.onChangedExpandexIndex(
                          index, ExpandeIndexType.filterWithLocation),
                      child: CategoryWidget(
                        categoryModel: controller.listFilterWithLocation[index],
                        index: index,
                        expandeIndex:
                            controller.expandeIndexlistFilterWithLocation,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSemiLarge,
            MyButton(
                width: px100 * 2,
                disable: controller.expandeIndexFilterSearch == -1 &&
                        controller.expandeIndexlistFilterWithLocation == -1
                    ? true
                    : false,
                text: "تطبيق"),
          ],
        ),
      ),
    ),
  );
}

dialogApp() {
  Get.bottomSheet(
    Container(
      height: Get.height * .4,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    ),
  );
}

showMySnackbar(
    {required String title,
    String body = '',
    Color? backgroundColor,
    SnackPosition? snackPosition}) {
  Get.snackbar(
    title,
    body,
    colorText: Colors.white,
    snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    borderRadius: 13,
    backgroundColor: backgroundColor ?? kcPrimary,
  );
}


/*
showBottomSheetCiteis() {
  return Get.bottomSheet(
    SingleChildScrollView(
      child: Column(
        children: [
          ContainerWithDecoration(
              topLeft: 20,
              topRight: 20,
              color: Colors.white,
              width: double.infinity,
              child: IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close))),
          CountryWidget(axis: Axis.horizontal, height: Get.height * .1),
          const CityWidget()
        ],
      ),
    ),
  );
}
*/