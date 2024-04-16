import 'package:badal/controller/my_controller.dart';
import 'package:badal/controller/privacy_policy_controller/privacy_policy_view_model.dart';
import 'package:badal/models/privacy_policy_model.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/methode_helper.dart';

class PrivacyPolicyController extends MyController {
  @override
  String errorMessage = '';

  LoadingState loading = LoadingState.initial;
  PrivacyPolicyViewModel policyViewModel = PrivacyPolicyViewModel();
  List<PrivacyPolicy> listPrivacyPolicy = [];

  @override
  onInit() {
    getPrivacyPolicy();
    super.onInit();
  }

  getPrivacyPolicy() async {
    changeLoadingState(LoadingState.loading, LoadingType.none);
    try {
      listPrivacyPolicy = await policyViewModel.getPrivacyPolicy();
      // if (response.code == 0) {
      //   changeLoadingState(LoadingState.loaded, LoadingType.none);
      // }
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () =>
            changeLoadingState(LoadingState.error, LoadingType.none),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  /// methode helper

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {}

  errorMessageUpdate(String message) {
    errorMessage = message;
    update();
  }
}
