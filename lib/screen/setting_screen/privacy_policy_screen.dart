import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcAccentLight,
      appBar: AppBar(title: Text(AppConfig.settings.tr)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: MyText.h6("controller.privacyPolicyModel.description",
              maxLines: 10000, fontSize: Get.height * .02, color: Colors.black),
        ),
      ),
    );
  }
}
