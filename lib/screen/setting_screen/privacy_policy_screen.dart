import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/setting_item_widget.dart';
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
        child: Column(
          children: [
            verticalSpaceMedium,
            SettingItemWidget(
                title: AppConfig.support.tr, icon: Icons.support_agent_rounded),
            SettingItemWidget(
                title: AppConfig.faq.tr, icon: Icons.note_alt_outlined),
            SettingItemWidget(
                title: AppConfig.privacyPolicy.tr, icon: Icons.security),
            SettingItemWidget(
                title: AppConfig.deleteAccount.tr, icon: Icons.delete),
          ],
        ),
      ),
    );
  }
}
