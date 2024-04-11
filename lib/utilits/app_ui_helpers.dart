import 'package:badal/utilits/all_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///////////// ui helper /////////////

const Widget horizontalSpaceTiny = SizedBox(width: 4.0);
Widget horizontalSpaceLargTiny = SizedBox(width: px5);
const Widget horizontalSpaceSmall = SizedBox(width: 8.0);
Widget horizontalSpaceRegular = SizedBox(width: Get.height * .020566);
const Widget horizontalSpaceMedium = SizedBox(width: 24.0);
Widget horizontalSpaceSemiLarge = SizedBox(width: px32);
const Widget horizontalSpaceLarge = SizedBox(width: 48.0);

/// 1000 pix
/// Get.width * .2778

/// 5.0 pix
final double px5 = Get.height * .00642677;

/// 10.0 pix
final double px10 = Get.height * .0128535;

/// 12.0 pix
final double px12 = Get.height * .015425;

/// 14.0 pix
final double px14 = Get.height * .018;

/// 16.0 pix
final double px16 = Get.height * .020566;

/// 18.0 pix
final double px18 = Get.height * .02314;

/// 20.0 pix
final double px20 = Get.height * .0258;

/// 25.0 pix
final double px25 = Get.height * .03214;

/// 32.0 pix
final double px32 = Get.height * .0412;

/// 50.0 pix
final double px50 = Get.height * .064268;

/// 90.0 pix
final double px90 = Get.height * .1157;

/// 100.0 pix
final double px100 = Get.height * .12854;

///  4.0 pix
Widget verticalSpaceTiny = SizedBox(height: Get.height * .00515);

///  8.0 pix
Widget verticalSpaceSmall = SizedBox(height: Get.height * .01029);

/// 16.0 pix
Widget verticalSpaceRegular = SizedBox(height: Get.height * .020566);

///  24.0 pix
Widget verticalSpaceMedium = SizedBox(height: Get.height * .0309);

///  32.0 pix
Widget verticalSpaceSemiLarge = SizedBox(height: px32);

/// 48 pix
Widget verticalSpaceLarge = SizedBox(height: Get.height * .0617);

/// 64 pix
Widget verticalSpaceXLarge = SizedBox(height: Get.height * .0823);

/// 84 pix
Widget verticalSpaceXXLarge = SizedBox(height: Get.height * .108);

/// 100 pix
Widget verticalSpaceXXXLarge = SizedBox(height: Get.height * .128535);

///////////// methode helper /////////////

bool isLoadingButton(LoadingState loadingState) {
  if (loadingState == LoadingState.loading) {
    return true;
  } else {
    return false;
  }
}
/*

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eysali/shared_widgets/my_button.dart';
import 'package:eysali/utilits/all_enum.dart';
import 'package:eysali/utilits/app_config.dart';
import 'package:eysali/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared_widgets/my_text.dart';
import 'app_theme.dart';

handlingCatchError({
  String? messageNoData,
  required Object error,
  required Function() changeLoadingState,
  bool showSnackbar = false,
  // Function()? tryAgain,
  required Function(String message) errorMessageUpdate,
}) {
  changeLoadingState();
  log("error message : $error");

  if (error is TimeoutException) {
    errorMessageUpdate(AppConfig.timeOut.tr);

    if (showSnackbar) {
      showMySnackbar(
        title: AppConfig.timeOut.tr,
        backgroundColor: Colors.red,
      );
    }
  } else if (error is DioException) {
    if (error.toString().contains("TimeoutException") ||
        error.toString().contains("connection timeout")) {
      errorMessageUpdate(AppConfig.noInternet.tr);
    } else if (error.toString().contains("SocketException") ||
        error.toString().contains("Network is unreachable")) {
      errorMessageUpdate(AppConfig.noInternet.tr);
    } else if (error.response!.statusCode == 400) {
      showMySnackbar(
        title: error.response!.data['message'].toString(),
        backgroundColor: Colors.red,
      );
      errorMessageUpdate(error.response!.data['message'].toString());
      // errorMessageUpdate(messageNoData ?? AppConfig.noData.tr);
    } else if (error.response!.statusCode == 500) {
      showMySnackbar(
        title: error.response!.data['error'].toString(),
        backgroundColor: Colors.red,
      );
      errorMessageUpdate(error.response!.data['message'].toString());
    } else {
      if (error.response != null) {
        errorMessageUpdate(error.response!.data['message']);
      }
      // errorMessageUpdate(error.message.toString());
    }
  }
}

bottomSheetApp(
    {double? height,
    String? description,
    String? title,
    String? cancelText,
    String? image,
    Function()? onTapOk,
    Function()? onTapCancel,
    String? okText}) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      height: height ?? Get.height * .34,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            verticalSpaceSmall,
            verticalSpaceSmall,
            Align(
              alignment: Alignment.center,
              child: MyText.h6(
                title ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w200,
                fontSize: px20,
              ),
            ),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.center,
              child: MyText.h6(
                description ?? "",
                maxLines: 2,
                fontSize: px20,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w300,
              ),
            ),
            verticalSpaceSemiLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cancelText == null
                    ? SizedBox()
                    : MyButton(
                        text: cancelText,
                        width: Get.width * .4,
                        textColorButton: Colors.black,
                        color: Color.fromARGB(255, 225, 225, 227),
                        onTap: onTapCancel ?? () => Get.back(),
                      ),
                MyButton(
                  text: okText ?? "",
                  width: Get.width * .4,
                  onTap: onTapOk ?? () => Get.back(),
                ),
              ],
            ),
            verticalSpaceSmall,
          ],
        ),
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
    duration: const Duration(seconds: 4),
    borderRadius: 13,
    backgroundColor: backgroundColor ?? kcAccent,
  );
}

myAppBar(
    {required String title,
    Widget? trailing,
    Widget? leading,
    Color? colorIcon,
    double? fontSize,
    Color? backgroundColor,
    Color? colorTitle,
    void Function()? onTapLeading,
    bool automaticallyImplyLeading = false,
    Color? iconLeadingColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? kcAccent,
    // automaticallyImplyLeading: false,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onTapLeading ?? () => Get.back(),
          icon: leading ?? const SizedBox(),
          color: colorIcon ?? Colors.white,
        ),
        MyText.h6(title,
            color: colorTitle ?? Colors.white, fontSize: fontSize ?? px16),
        IconButton(
          onPressed: () {},
          icon: trailing ?? const SizedBox(),
        ),
      ],
    ),
  );
}



*/

