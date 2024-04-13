import 'package:badal/utilits/app_config.dart';
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
    errorMessageUpdate(error.response!.data['responseMessage']['messageAR']);
  } else {
    errorMessageUpdate(AppConfig.somthimgWroing.tr);
  }
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