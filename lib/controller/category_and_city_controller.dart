import 'package:badal/controller/my_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/all_enum.dart';

class CategoryAndCityController extends MyController {
  int expandeIndexCategory = 0;
  int expandeIndexSubCategory = 0;
  int expandeIndexFilterSearch = -1;
  int expandeIndexlistFilterWithLocation = -1;
  String? valueCategory;
  String? valueSubCategory;
  String? valueCity;
  String? valueState;
  bool valueSwitch = true;
  bool valueCheckboxAgremnt = false;

  @override
  String errorMessage = "";
  ////
  List<CategoryModel> listCategory = [
    CategoryModel(1, "قسم رجالي"),
    CategoryModel(2, "قسم نسائي"),
    CategoryModel(3, "قسم اطفالي"),
  ];
  List<CategoryModel> listSubCategory = [
    CategoryModel(1, "ملابس"),
    CategoryModel(2, "احذية"),
    CategoryModel(3, "ساعات"),
    CategoryModel(4, "اكسسوارات"),
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

  List<CategoryModel> listSearchFilter = [
    CategoryModel(1, "حسب الأحدث"),
    CategoryModel(2, "حسب الأقدم"),
    CategoryModel(3, "حسب الأقل سعراً"),
    CategoryModel(4, "حسب الأكثر سعراً"),
  ];
  List<CategoryModel> listFilterWithLocation = [
    CategoryModel(1, "حسب الأقرب"),
  ];
  @override
  void onInit() {
    listCategory.insert(0, CategoryModel(0, "كل الاقسام"));
    listSubCategory.insert(0, CategoryModel(0, "الكل"));
    super.onInit();
  }

  /// methode helper
  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {
    throw UnimplementedError();
  }

  onChangedExpandexIndex(int index, ExpandeIndexType expandeIndexType) {
    if (expandeIndexType == ExpandeIndexType.category) {
      expandeIndexCategory = index;
    } else if (expandeIndexType == ExpandeIndexType.subCategory) {
      expandeIndexSubCategory = index;
    } else if (expandeIndexType == ExpandeIndexType.filterSearch) {
      expandeIndexFilterSearch = index;
    } else if (expandeIndexType == ExpandeIndexType.filterWithLocation) {
      expandeIndexlistFilterWithLocation = index;
    } else if (expandeIndexType == ExpandeIndexType.clearAllFilter) {
      expandeIndexlistFilterWithLocation = index;
      expandeIndexFilterSearch = index;
    }
    update();
  }

  onChangedValueSwitch(bool value) {
    valueSwitch = value;
    update();
  }

  onChangedValueCheckboxAgremnt(bool value) {
    valueCheckboxAgremnt = value;
    update();
  }

  onChangedValueSelected(String valueSelected, DropdownType dropdownType) {
    if (dropdownType == DropdownType.category) {
      valueCategory = valueSelected;
    } else if (dropdownType == DropdownType.city) {
      valueCity = valueSelected;
    } else if (dropdownType == DropdownType.state) {
      valueState = valueSelected;
    } else if (dropdownType == DropdownType.subCategory) {
      valueSubCategory = valueSelected;
    }

    update();
  }
}
