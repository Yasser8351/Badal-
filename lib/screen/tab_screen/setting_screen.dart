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
                title: AppConfig.notifications.tr, icon: Icons.notifications),
            SettingItemWidget(
                title: AppConfig.paymentFeesSubscriptions.tr,
                icon: CupertinoIcons.money_dollar_circle),
            SettingItemWidget(
                title: AppConfig.language.tr, icon: Icons.language_outlined),
            SettingItemWidget(
                title: AppConfig.support.tr, icon: Icons.support_agent_rounded),
            SettingItemWidget(
                title: AppConfig.faq.tr, icon: Icons.note_alt_outlined),
            SettingItemWidget(
                title: AppConfig.privacyPolicy.tr, icon: Icons.security),
            SettingItemWidget(title: AppConfig.logout.tr, icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}
