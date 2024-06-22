import 'package:badal/utilits/app_image.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.logo2,
      width: width,
      height: height,
    );
    // return CircleAvatar(
    //   radius: Get.width * .19,
    //   // foregroundColor: kcPrimary,
    //   // backgroundColor: kcPrimary,
    //   backgroundImage: AssetImage(AppImage.logo2),
    //   //
    // );
  }
}
