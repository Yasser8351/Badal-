import 'package:badal/controller/my_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_image.dart';

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
    CategoryModel(id: 0, name: "فساتين عرايس", image: AppImage.cat4),
    CategoryModel(id: 1, name: "فساتين سهرة", image: AppImage.cat3),
    CategoryModel(id: 2, name: "الاجهزة", image: AppImage.cat1),
  ];
  List<CategoryModel> listCategory2 = [
    CategoryModel(id: 3, name: "اكسسوارات", image: AppImage.cat2),
    CategoryModel(id: 4, name: "الشنط", image: AppImage.cat5),
    CategoryModel(id: 5, name: "مستلزمات  الأطفال ", image: AppImage.cat6),
  ];
  List<CategoryModel> listSubCategory = [
    CategoryModel(id: 1, name: "ملابس"),
    CategoryModel(id: 2, name: "احذية"),
    CategoryModel(id: 3, name: "ساعات"),
    CategoryModel(id: 4, name: "اكسسوارات"),
  ];

  List<CategoryModel> listCity = [
    CategoryModel(id: 1, name: "الرياض"),
    CategoryModel(id: 2, name: "جدة"),
    CategoryModel(id: 3, name: "مكة المكرمة"),
  ];
  List<CategoryModel> listState = [
    CategoryModel(id: 1, name: "القنفذة"),
    CategoryModel(id: 2, name: "الكامل"),
    CategoryModel(id: 3, name: "الليث"),
  ];

  List<CategoryModel> listSearchFilter = [
    CategoryModel(id: 1, name: "حسب الأحدث"),
    CategoryModel(id: 2, name: "حسب الأقدم"),
    CategoryModel(id: 3, name: "حسب الأقل سعراً"),
    CategoryModel(id: 4, name: "حسب الأكثر سعراً"),
  ];
  List<CategoryModel> listFilterWithLocation = [
    CategoryModel(id: 1, name: "حسب الأقرب"),
  ];
  @override
  void onInit() {
    // listCategory.insert(0, CategoryModel(id: 0, name: "كل الاقسام"));
    // listSubCategory.insert(0, CategoryModel(id: 0, name: "الكل"));
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
