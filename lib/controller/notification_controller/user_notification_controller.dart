import 'package:badal/controller/notification_controller/user_notification_services.dart';
import 'package:badal/models/notifcation_model/notification_model.dart';
import 'package:badal/models/products_model.dart';
import 'package:badal/utilits/api_url.dart';
import 'package:badal/utilits/methode_helper.dart';
import 'package:get/get.dart';
import 'package:badal/utilits/all_enum.dart';

class UserNotificationController extends GetxController {
  UserNotificationsServices notificationServices = UserNotificationsServices();
  LoadingState loadingState = LoadingState.initial;
  NotificationModel listNotifications = NotificationModel(
      notifications: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);
  String errorMessage = "";
  int countUnReadNotifcation = 0;
  int pageNumber = 0;
  int pageSize = 6;
  @override
  void onInit() {
    getCountForUnReadNotifcation();
    super.onInit();
  }

  getNotifications() async {
    pageNumber = 1;
    changeLoadingState(LoadingState.loading);
    try {
      listNotifications = await notificationServices
          .getNotifications(pageNumber: pageNumber, pageSize: pageSize)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getNotificationMore({String orderBy = "", bool isMore = false}) async {
    pageNumber = pageNumber + 1;

    try {
      notificationServices
          .getNotifications(pageNumber: pageNumber, pageSize: pageSize)
          .timeout(const Duration(seconds: ApiUrl.timeLimit))
          .then((value) => {
                listNotifications.notifications.addAll(value.notifications),
                update()
              });
    } catch (error) {}
  }

  readNotification({required int notificationId}) async {
    try {
      await notificationServices
          .readNotification(notificationId: notificationId)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));

      await getCountForUnReadNotifcation();
      await getNotifications();
    } catch (error) {
      // HandlingCatchError(
      //   error: error,
      //   changeLoadingState: () => changeLoadingState(LoadingState.error),
      //   errorMessageUpdate: (message) => errorMessageUpdate(message),
      // );
    }
  }

  getCountForUnReadNotifcation() async {
    try {
      countUnReadNotifcation = await notificationServices
          .getCountForUnReadNotifcation()
          .timeout(const Duration(seconds: ApiUrl.timeLimit));
    } catch (error) {}
  }

  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingState = state;
    update();
  }
}
