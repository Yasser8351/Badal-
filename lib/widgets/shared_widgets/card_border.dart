import 'package:flutter/material.dart';

class CardBorder extends StatelessWidget {
  const CardBorder(
      {super.key,
      required this.child,
      this.padding,
      this.color,
      this.borderRadius,
      this.shape});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      shape: shape ??
          const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
      elevation: 2,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0.0),
        child: child,
      ),
    );
  }
}
