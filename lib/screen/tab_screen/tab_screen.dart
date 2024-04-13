import 'dart:async';

import 'package:badal/screen/auth_screen/sign_up_screen.dart';
import 'package:badal/screen/setting_screen/add_product.dart';
import 'package:badal/screen/tab_screen/chat_screen.dart';
import 'package:badal/screen/tab_screen/favorite_screen.dart';
import 'package:badal/screen/tab_screen/home_screen.dart';
import 'package:badal/screen/setting_screen/setting_screen.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TabScreen extends StatefulWidget {
  TabScreen({Key? key, this.selectIndex = 0}) : super(key: key);
  int selectIndex;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  DateTime timeBackPressed = DateTime.now();
  bool isLogin = true;

  void _navigateBottomBar(int index) {
    setState(() {
      widget.selectIndex = index;
    });
    // if (widget.selectIndex == 1 && isLogin) {
    //   loginFirst();
    // }
  }

  loginFirst() {
    showMySnackbar(title: "يجب عليك تسجيل الدخول اولا");
    Timer(
        const Duration(seconds: 3), () => Get.off(() => const SignUpScreen()));
  }

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const AddProduct(),
    const ChatScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: WillPopScope(
              onWillPop: () async {
                return onBackApp(context);
              },
              child: Scaffold(
                body: pages[widget.selectIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: kcAccentLight,
                  selectedIconTheme:
                      const IconThemeData(color: kcPrimary, size: 26),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: widget.selectIndex,
                  onTap: _navigateBottomBar,
                  selectedItemColor: kcPrimary,
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(CupertinoIcons.home),
                        label: AppConfig.home.tr,
                        backgroundColor: kcAccent),
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.heart),
                      label: AppConfig.favorite.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.add_circled_solid,
                          size: px50, color: kcPrimary),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.chat_bubble),
                      label: AppConfig.chat.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: AppConfig.settings.tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool onBackApp(BuildContext context) {
    final differenc = DateTime.now().difference(timeBackPressed);
    final exitApp = differenc >= const Duration(seconds: 2);

    timeBackPressed = DateTime.now();

    if (exitApp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          duration: const Duration(seconds: 2),
          content: const Text(
            "اضغط مرة اخرى للخروج من التطبيق",
            textAlign: TextAlign.right,
          ),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
