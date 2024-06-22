import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.width, this.widthBorder});
  final double? width;
  final double? widthBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: px5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: widthBorder ?? .5),
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          )),
      width: width ?? px50,
    );
  }
}
