import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {Key? key,
      this.lable,
      required this.list,
      required this.onChangedValueSelected,
      required this.valueDrowpDownSelected,
      required this.hint})
      : super(key: key);
  final List<dynamic> list;
  final Function(String value) onChangedValueSelected;
  final String? valueDrowpDownSelected;
  final String hint;
  final String? lable;

  @override
  Widget build(BuildContext context) {
    return
        // MyText.h6(
        //   lable ?? "",
        //   fontWeight: FontWeight.normal,
        // ),
        // verticalSpaceSmall,
        DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: Text(
          hint,
          style: TextStyle(color: kcGrey600),
        ),
        onChanged: (value) {
          onChangedValueSelected(value ?? "");
        },
        // style: const TextStyle(color: kcPrimary),
        value: valueDrowpDownSelected,
        // alignment: AlignmentDirectional.lerp(a, b, 10.1),

        // isExpanded: true,
        iconSize: px25,
        iconEnabledColor: kcPrimary,
        iconDisabledColor: kcGreyLightDark,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        items: list
            .map(
              (item) => DropdownMenuItem<String>(
                value: item.id.toString(),
                child: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
