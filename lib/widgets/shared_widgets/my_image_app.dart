// import 'package:cached_network_image/cached_network_image.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:real_estate/utilits/app_image.dart';

class MyImageApp extends StatelessWidget {
  const MyImageApp(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.alignment,
      this.color,
      this.onTap,
      this.fit,
      this.errorWidget,
      this.filterQuality});
  final String image;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;

  final Color? color;
  final Function()? onTap;
  final BoxFit? fit;
  final Widget? errorWidget;
  final FilterQuality? filterQuality;

  @override
  Widget build(BuildContext context) {
    if (image.contains("svg")) {
      return InkWell(
        onTap: onTap,
        child: Image.asset(
          alignment: alignment ?? AlignmentDirectional.center,
          image,
          width: width ?? px32,
          height: height ?? px32,
        ),
      );
      // child: SvgPicture.asset(image, semanticsLabel: 'Acme Logo'));
    } else if (image.contains("http") || image.contains("https")) {
      return InkWell(
        onTap: onTap,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => Image.asset(
            alignment: alignment ?? AlignmentDirectional.center,
            AppImage.placeholder,
            width: width ?? px32,
            height: height ?? px32,
          ),
          alignment: Alignment.center,
          color: color,
          // alignment: alignment ?? AlignmentDirectional.center,
          imageUrl: image,
          placeholder: (context, url) => Center(
            child: FadeInImage(
              placeholder: const AssetImage(AppImage.placeholder),
              image: const AssetImage(AppImage.placeholder),
              width: width ?? px32,
              height: height ?? px32,
              fit: fit,
            ),
          ),
          width: width ?? px32,
          height: height ?? px32,
        ),
        /*
        child: CachedNetworkImage(
          width: width,
          height: height,
          color: color,
          fit: fit,
          filterQuality: filterQuality ?? FilterQuality.high,
          imageUrl: image,
          placeholder: (context, url) => Center(
            child: FadeInImage(
              placeholder: AssetImage(AppImage.placeholder),
              image: AssetImage(AppImage.logo),
              width: double.infinity,
              height: 120,
              fit: fit,
            ),
          ),
          errorWidget: (context, url, error) =>
              errorWidget ?? Icon(Icons.error),
        ),
      */
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Image.asset(
          alignment: alignment ?? AlignmentDirectional.center,
          image,
          color: color,
          width: width ?? px32,
          height: height ?? px32,
        ),
      );
    }
  }
}
