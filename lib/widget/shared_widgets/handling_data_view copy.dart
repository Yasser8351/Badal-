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
              ? const CircularProgressIndicator()
              : shimmerType == ShimmerType.shimmerListRectangular
                  ? const CircularProgressIndicator()
                  : shimmerType == ShimmerType.shimmerCircular
                      ? const CircularProgressIndicator()
                      : shimmerType == ShimmerType.shimmerHorizontal
                          ? const CircularProgressIndicator()
                          // ? const ShimmerRectangular()
                          // : shimmerType == ShimmerType.shimmerListRectangular
                          //     ? ShimmerListRectangular(itemCount: itemCount)
                          //     : shimmerType == ShimmerType.shimmerCircular
                          //         ? const ShimmerCircular()
                          //         : shimmerType == ShimmerType.shimmerHorizontal
                          //             ? const ShimmerHorizontal()
                          : const Center(
                              child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircularProgressIndicator(),
                            ))
          : loadingState == LoadingState.empty
              ? const MyText.h4("لايوجد بيانات")
              : loadingState == LoadingState.error
                  ? RetryWidget(
                      sizedBoxHeight: sizedBoxHeight,
                      height: heightRetryWidget ?? Get.height / 5,
                      errorMessage:
                          errorMessage ?? "AppConfig.somthimgWroing.tr",
                      errorMessageColor: errorMessageColor,
                      onTap: tryAgan ?? () {},
                    )
                  : loadingState == LoadingState.socketException
                      ? const MyText.h4("internet week")
                      : widget,
    );
  }
}

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
                        color: Theme.of(context).colorScheme.primary,
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
/*

class ShimmerListRectangular extends StatelessWidget {
  const ShimmerListRectangular({Key? key, this.itemCount}) : super(key: key);
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
          height: Get.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemCount ?? 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: const Color.fromARGB(255, 212, 212, 212),
                  child: ContainerWithDecoration(
                    bottomLeft: 10,
                    bottomRight: 10,
                    topLeft: 10,
                    topRight: 10,
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 110,
                          height: 170,
                        ),
                        SizedBox(width: 33),
                      ],
                    ),
                  )),
            ),
          )),
    );
  }
}

class ShimmerCircular extends StatelessWidget {
  const ShimmerCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .052),
      child: SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 212, 212, 212),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: ContainerWithDecoration(
                    bottomLeft: 150,
                    bottomRight: 150,
                    topLeft: 150,
                    topRight: 150,
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 90,
                          // width: Get.width * .9,
                          // height: Get.width * .57,
                        ),
                        SizedBox(width: 33),
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}

class ShimmerHorizontal extends StatelessWidget {
  const ShimmerHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, top: 15),
      child: SizedBox(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 212, 212, 212),
                child: ContainerWithDecoration(
                  bottomLeft: 10,
                  bottomRight: 10,
                  topLeft: 10,
                  topRight: 10,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 110,
                        height: 170,
                        // width: Get.width * .9,
                        // height: Get.width * .57,
                      ),
                      SizedBox(width: 33),
                    ],
                  ),
                )),
          )),
    );
  }
}

class ShimmerRectangular extends StatelessWidget {
  const ShimmerRectangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 25, top: 15, end: 25),
        child: SizedBox(
          height: 150,
          child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: const Color.fromARGB(255, 212, 212, 212),
              child: ContainerWithDecoration(
                bottomLeft: 10,
                bottomRight: 10,
                topLeft: 10,
                topRight: 10,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 170,
                      // width: Get.width * .9,
                      // height: Get.width * .57,
                    ),
                    SizedBox(width: 33),
                  ],
                ),
              )),
        ));
  }
}


*/