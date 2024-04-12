import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsetsDirectional.only(start: px10, end: px10, bottom: px18),
        child: Container(
          decoration: const BoxDecoration(
              color: kcPrimary,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Container(
              padding: EdgeInsetsDirectional.all(px20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10),
                    bottomStart: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(icon, color: kcPrimary),
                  horizontalSpaceMedium,
                  MyText.h6(title),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, color: kcPrimary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
