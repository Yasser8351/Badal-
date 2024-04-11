import 'package:badal/screen/tab_screen/home_screen.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TabScreen extends StatefulWidget {
  TabScreen({Key? key, this.selectIndex = 0, this.show = true})
      : super(key: key);
  int selectIndex;
  bool show;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  DateTime timeBackPressed = DateTime.now();

  void _navigateBottomBar(int index) {
    setState(() {
      widget.selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    // const SettingScreen(),
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
                      icon: const Icon(CupertinoIcons.add_circled),
                      label: AppConfig.home.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.add_circled, size: px32),
                      label: AppConfig.home.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.payment),
                      label: AppConfig.home.tr,
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
