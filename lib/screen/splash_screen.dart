import 'dart:async';
import 'package:badal/screen/tab_screen/tab_screen.dart';
// import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widgets/shared_widgets/logo_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomeScreen();
    super.initState();
  }

  goToHomeScreen() {
    Timer(const Duration(seconds: 2), () => Get.off(() => TabScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kcAccent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .16),
          child: const Hero(
            tag: "logo",
            child: LogoApp(),
          ),
        ),
      ),
    );
  }
}
