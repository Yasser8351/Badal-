import 'package:badal/screen/notication_screen/user_notifcation_screen.dart';
import 'package:badal/screen/setting_screen/privacy_app_screen.dart';
import 'package:badal/screen/tab_screen/favorite_screen.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/setting_item_widget.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
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
          backgroundColor: Colors.white,
          title: MyText.h6(AppConfig.settings.tr, color: Colors.black),
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceMedium,
            SettingItemWidget(title: AppConfig.profile.tr, icon: Icons.person),
            SettingItemWidget(
                onTap: () => Get.to(() => const UserNotifcationScreen()),
                title: AppConfig.notifications.tr,
                icon: Icons.notifications_none_outlined),
            SettingItemWidget(title: AppConfig.likes.tr, icon: Icons.done),
            SettingItemWidget(
                onTap: () => Get.to(() => const FavoriteScreen()),
                title: AppConfig.favorite.tr,
                icon: Icons.favorite_border),
            SettingItemWidget(
                title: AppConfig.paymentFeesSubscriptions.tr,
                icon: CupertinoIcons.money_dollar_circle),
            SettingItemWidget(
              onTap: () => Get.to(() => const PrivacyAppScreen()),
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
