import 'package:badal/controller/my_controller.dart';
import 'package:badal/utilits/all_enum.dart';

class AddProductController extends MyController {
  @override
  String errorMessage = '';

  ///////////////////

  /// methode helper ///

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {}
}

/////////////////////
class CategoryModel {
  final int id;
  final String name;

  CategoryModel(this.id, this.name);
}
