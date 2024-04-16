import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final _ButtonType _buttonType;
  final bool busy;
  final bool iconIsImage;
  final bool disable;
  final double width;
  final EdgeInsetsGeometry? padding;
  final IconData? leadingIcon;
  final Color? color;
  final Color? textColorButton;
  const MyButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.padding,
      this.busy = false,
      this.iconIsImage = false,
      this.textColorButton,
      this.disable = false,
      this.width = double.maxFinite,
      this.leadingIcon,
      this.color})
      : _buttonType = _ButtonType.filled,
        super(key: key);
  const MyButton.outlined(
      {Key? key,
      required this.text,
      this.onTap,
      this.textColorButton,
      this.padding,
      this.busy = false,
      this.disable = false,
      this.width = double.maxFinite,
      this.leadingIcon,
      this.color})
      : _buttonType = _ButtonType.outlined,
        iconIsImage = false,
        super(key: key);
  const MyButton.text(
      {Key? key,
      required this.text,
      this.onTap,
      this.padding,
      this.busy = false,
      this.textColorButton,
      this.disable = false,
      this.width = double.maxFinite,
      this.leadingIcon,
      this.color})
      : _buttonType = _ButtonType.text,
        iconIsImage = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Material(
        color: getButtonColor(context),
        animationDuration: const Duration(milliseconds: 500),
        clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: _buttonType == _ButtonType.outlined
                ? BorderSide(color: color ?? kcAccent, width: 1.0)
                : BorderSide.none),
        child: SizedBox(
          width: width,
          height: 48.0,
          child: InkWell(
            splashColor: _buttonType == _ButtonType.filled
                ? color?.withOpacity(0.5)
                : null,
            // highlightColor: kcPrimarySwatch[],
            splashFactory: InkRipple.splashFactory,
            onTap: disable || busy ? null : onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (leadingIcon != null && !busy)
                  Icon(
                    leadingIcon,
                    color: getTextColor(context),
                  ),
                if (leadingIcon != null && !busy) horizontalSpaceSmall,
                if (!busy)
                  MyText.button(text,
                      color: textColorButton ?? getTextColor(context),
                      fontSize: px20),
                if (busy)
                  const SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kcPrimary),
                      strokeWidth: 3.0,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getButtonColor(BuildContext context) => disable
      ? Colors.grey.shade300
      : busy
          ? Colors.grey.shade300
          : _buttonType == _ButtonType.filled
              ? color ?? kcPrimary
              : Colors.transparent;
  Color getTextColor(BuildContext context) => disable
      ? kcGreyDark
      : _buttonType == _ButtonType.filled
          ? Colors.white
          : color ?? kcPrimary;
}

enum _ButtonType { filled, outlined, text }
