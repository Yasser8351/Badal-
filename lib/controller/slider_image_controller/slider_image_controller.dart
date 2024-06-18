import 'package:badal/controller/my_controller.dart';
import 'package:badal/controller/slider_image_controller/slider_image_services.dart';
import 'package:badal/models/image_sliders_model.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/api_url.dart';
import 'package:badal/utilits/methode_helper.dart';

class SliderImageController extends MyController {
  SilderImageViewModel silderImageServices = SilderImageViewModel();
  ImageSlidersModel imageSlidersModel = ImageSlidersModel();

  LoadingState loadingState = LoadingState.initial;
  int activeIndex = 0;

  @override
  String errorMessage = "";

  @override
  void onInit() {
    getSilderImage();
    super.onInit();
  }

  getSilderImage() async {
    changeLoadingState(LoadingState.loading, LoadingType.none);
    try {
      //listSildersImage
      var response = await silderImageServices
          .getSilderImage()
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      if (response['responseMessage']['statusCode'] == 200) {
        changeLoadingState(LoadingState.loaded, LoadingType.none);
        imageSlidersModel = ImageSlidersModel.fromJson(response);
      } else {
        handlingCatchError(
            error: response['responseMessage']['messageEN'],
            changeLoadingState: () =>
                changeLoadingState(LoadingState.error, LoadingType.none),
            errorMessageUpdate: (message) => errorMessageUpdate(message));
      }
    } catch (error) {
      handlingCatchError(
          error: error,
          changeLoadingState: () =>
              changeLoadingState(LoadingState.error, LoadingType.none),
          errorMessageUpdate: (message) => errorMessageUpdate(message));
    }
  }

  // @override
  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  // @override
  // changeLoadingState(LoadingState state,
  //     {LoadingType loadingType = LoadingType.none}) {
  //   loadingState = state;
  //   update();
  // }

  onPageChanged(int index) {
    activeIndex = index;
    update();
  }

  @override
  changeLoadingState(LoadingState state, LoadingType loadingType) {
    // TODO: implement changeLoadingState
    loadingState = state;
    update();
  }
}
