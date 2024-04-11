import 'package:badal/binding/binding_app.dart';
import 'package:badal/screen/splash_screen.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName.tr,
      theme: lightTheme,
      locale: const Locale("ar"),
      translations: AppLocalization(),
      // locale: contoller.local ?? const Locale("ar"),
      initialBinding: BinindingApp(),
      home: const SplashScreen(),
    );
  }
}
