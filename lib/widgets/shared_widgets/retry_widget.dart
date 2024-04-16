import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/utilits/app_config.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget(
      {Key? key,
      required this.errorMessage,
      this.meesageButton,
      required this.onTap,
      this.height,
      this.image,
      this.errorMessageColor,
      this.sizedBoxHeight = 4})
      : super(key: key);
  final String errorMessage;
  final String? meesageButton;
  final Function() onTap;

  final double? height;
  final String? image;
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
                  if (image != null) ...[
                    MyImageApp(
                        image: AppImage.placeholder, width: px90, height: px90),
                    const SizedBox(height: 10),
                  ],
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
  }
}
