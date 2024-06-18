import 'package:badal/controller/my_controller.dart';
import 'package:badal/utilits/all_enum.dart';

class AddProductController extends MyController {
  @override
  String errorMessage = '';

  bool isNew = true;

  ///////////////////

  /// methode helper ///

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {}

  selectAccountType(_isNew) {
    isNew = _isNew;
    update();
  }
}

/////////////////////
class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, this.image = ''});
}
