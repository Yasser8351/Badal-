import 'package:badal/widgets/shared_widgets/all_shimmers_widgets.dart.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:badal/widgets/shared_widgets/retry_widget.dart';
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
      child: getHandingWidget(),
    );
  }

  Widget getWidgetCases() {
    if (loadingState == LoadingState.initial ||
        loadingState == LoadingState.loading) {
      if (shimmerType == ShimmerType.shimmerRectangular) {
        return const ShimmerRectangular();
      } else if (shimmerType == ShimmerType.shimmerCircular) {
        return const ShimmerCircular();
      } else if (shimmerType == ShimmerType.shimmerListRectangular) {
        return ShimmerListRectangular(itemCount: itemCount);
      } else {
        return const ShimmerHorizontal();
      }
    } else if (loadingState == LoadingState.empty) {
      return MyText.h4(AppConfig.noDataFound.tr);
    } else if (loadingState == LoadingState.error) {
      return RetryWidget(
        sizedBoxHeight: sizedBoxHeight,
        height: heightRetryWidget ?? Get.height / 5,
        errorMessage: errorMessage ?? AppConfig.somthimgWroing.tr,
        errorMessageColor: errorMessageColor,
        onTap: tryAgan ?? () {},
      );
    } else {
      return widget;
    }
  }

  getHandingWidget() {
    switch (loadingState) {
      case LoadingState.initial || LoadingState.loading:
        switch (shimmerType) {
          case ShimmerType.shimmerRectangular:
            return const ShimmerRectangular();
          case ShimmerType.shimmerCircular:
            return const ShimmerCircular();
          case ShimmerType.shimmerListRectangular:
            return ShimmerListRectangular(itemCount: itemCount);
          default:
            return const ShimmerHorizontal();
        }
      case LoadingState.empty:
        return MyText.h4(AppConfig.noDataFound.tr);
      case LoadingState.error:
        return RetryWidget(
          sizedBoxHeight: sizedBoxHeight,
          height: heightRetryWidget ?? Get.height / 5,
          errorMessage: errorMessage ?? AppConfig.somthimgWroing.tr,
          errorMessageColor: errorMessageColor,
          onTap: tryAgan ?? () {},
        );
      default:
        return widget;
    }
  }
}






/*
    return loadingState == LoadingState.initial ||
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
                    : widget;

                    */
 