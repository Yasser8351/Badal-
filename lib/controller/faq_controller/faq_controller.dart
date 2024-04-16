import 'package:badal/controller/faq_controller/faq_view_model.dart';
import 'package:badal/controller/my_controller.dart';
import 'package:badal/models/faq_model.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/methode_helper.dart';

class FAQController extends MyController {
  @override
  String errorMessage = '';

  LoadingState loadingFAQ = LoadingState.initial;
  FAQViewModel faqViewModel = FAQViewModel();
  List<FAQ> listFaq = [];

  @override
  onInit() {
    getFAQ();
    super.onInit();
  }

  getFAQ() async {
    changeLoadingState(LoadingState.loading, LoadingType.none);
    try {
      listFaq = await faqViewModel.getFAQ();
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

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {}
  errorMessageUpdate(String message) {
    errorMessage = message;
    update();
  }
}
