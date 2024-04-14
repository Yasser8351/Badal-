import 'package:badal/controller/my_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/all_enum.dart';

class CategoryAndCityController extends MyController {
  int expandeIndex = 0;
  String? valueState;
  String? valueCategory;
  String? valueCity;

  @override
  String errorMessage = "";
  ////
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
  void onInit() {
    listCategory.insert(0, CategoryModel(0, "كل الاقسام"));
    super.onInit();
  }

  /// methode helper
  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {
    throw UnimplementedError();
  }

  onChangedExpandexIndex(int index) {
    expandeIndex = index;
    update();
  }

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