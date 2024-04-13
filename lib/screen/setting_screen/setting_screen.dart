import 'package:badal/screen/notication_screen/user_notifcation_screen.dart';
import 'package:badal/screen/setting_screen/privacy_policy_screen.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/setting_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcAccentLight.withAlpha(200),
      appBar: AppBar(
          title: Text(AppConfig.settings.tr), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceMedium,
            SettingItemWidget(title: AppConfig.profile.tr, icon: Icons.person),
            SettingItemWidget(
                onTap: () => Get.to(() => const UserNotifcationScreen()),
                title: AppConfig.notifications.tr,
                icon: Icons.notifications_none_outlined),
            SettingItemWidget(
                title: AppConfig.paymentFeesSubscriptions.tr,
                icon: CupertinoIcons.money_dollar_circle),
            SettingItemWidget(
              onTap: () => Get.to(() => const PrivacyPolicyScreen()),
              title: AppConfig.sitePolicies.tr,
              icon: Icons.settings,
            ),
            SettingItemWidget(
                title: AppConfig.language.tr, icon: Icons.language_outlined),
            SettingItemWidget(title: AppConfig.shareApp.tr, icon: Icons.share),
            SettingItemWidget(title: AppConfig.logout.tr, icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}
