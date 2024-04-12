import 'package:badal/controller/my_controller.dart';
import 'package:badal/utilits/all_enum.dart';

class TestController extends MyController {
  @override
  String errorMessage = "";

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {
    // TODO: implement changeLoadingState
    loadingState = state;
    update();
  }
}
