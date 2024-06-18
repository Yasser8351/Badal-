import 'package:badal/screen/setting_screen/setting_screen.dart';
import 'package:badal/screen/tab_screen/favorite_screen.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/screen/add_product/add_product.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // elevation: 60,
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalSpaceTiny,
                Icon(Icons.person, size: px50, color: kcPrimary),
                horizontalSpaceMedium,
                MyText.h5("اشتري وبيع"),
              ],
            ),
            verticalSpaceMedium,
            MyText.h6("مرحباً بك ابونايف"),
            verticalSpaceSmall,
            MenuItem(title: "الصفحة الشخصية", icon: Icons.home, onTap: () {}),
            MenuItem(
                title: "اضافة اعلان جديد",
                icon: Icons.add_box,
                onTap: () => Get.to(() => const AddProduct())),
            MenuItem(
                title: "المفضلة",
                icon: Icons.add_box,
                onTap: () => Get.to(() => const FavoriteScreen())),
            MenuItem(
                title: "الاعدادات",
                icon: Icons.settings,
                onTap: () => Get.to(() => const SettingScreen())),
          ],
        ),
      ),
    );
  }
}

Widget MenuItem(
    {required String title,
    required IconData icon,
    required VoidCallback onTap}) {
  return ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
        selectedColor: Colors.grey,
        selectedTileColor: Colors.black45,
        // selected: currentItem == item,
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap
        // onTap: () => onSlectedItem(item),
        ),
  );
}
