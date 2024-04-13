import 'package:badal/controller/my_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:flutter/material.dart';

class AddProductController extends MyController {
  @override
  String errorMessage = '';
  String? valueState;
  String? valueCategory;
  String? valueCity;
  TextEditingController titleProductController = TextEditingController();
  List<CategoryModel> listCategory = [
    CategoryModel(1, "قسم رجالي"),
    CategoryModel(2, "قسم نسائي"),
    CategoryModel(3, "قسم اطفالي"),
  ];
  List<CategoryModel> listCity = [
    CategoryModel(1, "الرياض"),
    CategoryModel(2, "جدة"),
    CategoryModel(3, "مكة المكرمة"),
  ];
  List<CategoryModel> listState = [
    CategoryModel(1, "القنفذة"),
    CategoryModel(2, "الكامل"),
    CategoryModel(3, "الليث"),
  ];

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {}

  onChangedValueSelected(String valueSelected, DropdownType dropdownType) {
    if (dropdownType == DropdownType.category) {
      valueCategory = valueSelected;
    } else if (dropdownType == DropdownType.city) {
      valueCity = valueSelected;
    } else if (dropdownType == DropdownType.state) {
      valueState = valueSelected;
    }

    update();
  }
}

/////////////////////
class CategoryModel {
  final int id;
  final String name;

  CategoryModel(this.id, this.name);
}
