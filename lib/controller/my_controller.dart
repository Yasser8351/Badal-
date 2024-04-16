import 'package:get/get.dart';
import 'package:badal/utilits/all_enum.dart';

abstract class MyController extends GetxController {
  LoadingState loadingState = LoadingState.initial;

  abstract String errorMessage;
  int pageNumber = 0;
  int pageSize = 5;

  changeLoadingState(LoadingState state, LoadingType loadingType);
  // errorMessageUpdate(String message);

  // changeLoadingState(LoadingState state, LoadingType loadingType) {
  //   loadingState = state;
  //   update();
  // }
}
