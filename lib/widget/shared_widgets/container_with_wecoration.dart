import 'package:flutter/material.dart';

class ContainerWithDecoration extends StatelessWidget {
  const ContainerWithDecoration(
      {Key? key,
      this.child,
      this.height,
      this.width,
      this.color,
      this.marginTop = 0,
      this.onTap,
      this.topLeft = 0,
      this.topRight = 0,
      this.bottomRight = 0,
      this.bottomLeft = 0,
      this.border,
      this.crossAxisAlignment,
      this.paddinLeft = 0,
      this.paddingRight = 0,
      this.paddingTop = 0,
      this.paddingBottom = 0})
      : super(key: key);
  final Widget? child;
  final Function()? onTap;
  final double? height;
  final double? width;
  final double? marginTop;
  final Color? color;
  final double topLeft;
  final double topRight;
  final double bottomRight;
  final double bottomLeft;
  final double paddinLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final BoxBorder? border;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        SizedBox(height: marginTop),
        InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            // height: MediaQuery.of(context).size.height * 1.1,
            decoration: BoxDecoration(
              border: border,
              color: color ?? Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomRight: Radius.circular(bottomRight),
                bottomLeft: Radius.circular(bottomLeft),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: paddingBottom,
                left: paddinLeft,
                right: paddingRight,
                top: paddingTop,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
