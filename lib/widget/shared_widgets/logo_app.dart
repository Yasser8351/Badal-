import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: Get.width * .19,
      foregroundColor: kcPrimary,
      backgroundColor: kcPrimary,
      child: MyText.h5(AppConfig.appName.tr, color: Colors.white),
    );
  }
}
