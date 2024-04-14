import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.onTap,
    this.width,
    this.onTapFilter,
    this.filterSearch,
    required this.controller,
    this.clearSearch,
    this.showCustomSuffixIcon = false,
    this.paddingBottom,
    this.paddingStart,
    this.paddingEnd,
    this.paddingTop,
    this.height,
    this.suffixIcon,
    this.hintText,
  }) : super(key: key);
  final Function() onTap;
  final double? height;
  final double? width;
  final double? paddingBottom;
  final double? paddingStart;
  final double? paddingEnd;
  final double? paddingTop;
  final Function()? filterSearch;
  final Function()? clearSearch;
  final Function(int index)? onTapFilter;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool showCustomSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: paddingBottom ?? 0,
        end: paddingEnd ?? 0,
        start: paddingStart ?? 0,
        top: paddingTop ?? 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kcAccentLight,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height ?? Get.height * .07,
        width: width ?? Get.width * .79,
        child: TextField(
          controller: controller,
          onSubmitted: (String v) {
            onTap();
          },
          onChanged: (value) {
            // onTap();
          },
          textInputAction: TextInputAction.search,
          cursorColor: kcPrimary,
          decoration: InputDecoration(
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? kcPrimary
                    : Colors.grey),
            suffixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? kcPrimary
                    : Colors.grey),
            focusColor: kcPrimary,
            suffixIcon: showCustomSuffixIcon
                ? suffixIcon
                : controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, color: kcAccent),
                        onPressed: clearSearch)
                    : const SizedBox(),
            prefixIcon: InkWell(
                onTap: onTap, child: const Icon(Icons.search, color: kcAccent)),
            hintText: hintText ?? AppConfig.searchHint.tr,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
