import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widget/shared_widgets/all_shimmers_widgets.dart.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_config.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    Key? key,
    required this.loadingState,
    required this.widget,
    this.shimmerType = ShimmerType.shimmerHorizontal,
    this.tryAgan,
    this.errorMessage,
    this.sizedBoxHeight = 7,
    this.itemCount,
    this.errorMessageColor,
    this.heightRetryWidget,
  }) : super(key: key);
  final LoadingState loadingState;
  final Widget widget;
  final Function()? tryAgan;
  final ShimmerType shimmerType;
  final String? errorMessage;
  final double? heightRetryWidget;
  final double sizedBoxHeight;
  final int? itemCount;
  final Color? errorMessageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loadingState == LoadingState.initial ||
              loadingState == LoadingState.loading
          ? shimmerType == ShimmerType.shimmerRectangular
              ? const ShimmerRectangular()
              : shimmerType == ShimmerType.shimmerListRectangular
                  ? ShimmerListRectangular(itemCount: itemCount)
                  : shimmerType == ShimmerType.shimmerCircular
                      ? const ShimmerCircular()
                      : const ShimmerHorizontal()
          : loadingState == LoadingState.empty
              ? MyText.h4(AppConfig.noDataFound.tr)
              : loadingState == LoadingState.error
                  ? RetryWidget(
                      sizedBoxHeight: sizedBoxHeight,
                      height: heightRetryWidget ?? Get.height / 5,
                      errorMessage: errorMessage ?? AppConfig.somthimgWroing.tr,
                      errorMessageColor: errorMessageColor,
                      onTap: tryAgan ?? () {},
                    )
                  : loadingState == LoadingState.socketException
                      ? MyText.h4(AppConfig.noInternet.tr)
                      : widget,
    );
  }
}

// buidCont(loadingState) {
//   switch (loadingState) {
//     case LoadingState.initial || LoadingState.loading:
//       return const ShimmerRectangular();
//       break;

//       defult:
//       return const ShimmerRectangular();
//   }
//   // shimmerType == ShimmerType.shimmerRectangular
// }

class RetryWidget extends StatelessWidget {
  const RetryWidget(
      {Key? key,
      required this.errorMessage,
      this.meesageButton,
      required this.onTap,
      this.height,
      this.errorMessageColor,
      this.sizedBoxHeight = 4})
      : super(key: key);
  final String errorMessage;
  final String? meesageButton;
  final Function() onTap;

  final double? height;
  final double sizedBoxHeight;
  final Color? errorMessageColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: sizedBoxHeight),
        SizedBox(
          height: height ?? Get.height / .05,
          width: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: 18, color: errorMessageColor ?? Colors.black),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: Get.width * .45,
                      height: Get.height * .06,
                      decoration: BoxDecoration(
                        color: kcPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.refresh, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            meesageButton ?? AppConfig.tryAgain.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // return MyText.h4("error");
  }
}
