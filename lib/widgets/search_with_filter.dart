import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/logo_app.dart';
import 'package:flutter/material.dart';
import 'package:badal/widgets/shared_widgets/search_widget.dart';
import 'package:get/get.dart';

class SearchWithFilter extends StatelessWidget {
  const SearchWithFilter({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LogoApp(
          width: px50,
          height: px50,
        ),

        horizontalSpaceLargTiny,
        SearchWidget(
          // paddingEnd: Get.height * .02,
          width: Get.width * .78,
          // width: Get.width * .9,
          onTap: () {},
          controller: searchController,
        ),

        // InkWell(
        //   onTap: () => dialogSearchFilter(),
        //   child: Container(
        //       decoration: BoxDecoration(
        //         color: kcAccentLight,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       height: Get.height * .07,
        //       width: Get.width * .15,
        //       child: const Icon(Icons.filter_list, color: kcPrimary)),
        // ),
      ],
    );
  }
}
