import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widget/shared_widgets/search_widget.dart';
import 'package:get/get.dart';

class SearchWithFilter extends StatelessWidget {
  const SearchWithFilter({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchWidget(
          paddingEnd: Get.height * .02,
          width: Get.width * .75,
          onTap: () {},
          controller: searchController,
        ),
        InkWell(
          onTap: () {
            dialogApp();
          },
          child: Container(
              decoration: BoxDecoration(
                color: kcAccentLight,
                borderRadius: BorderRadius.circular(10),
              ),
              height: Get.height * .07,
              width: Get.width * .15,
              child: const Icon(Icons.filter_list, color: kcPrimary)),
        ),
      ],
    );
  }
}
