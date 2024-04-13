import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// import 'dart:html';

import 'package:badal/base_request/base_http_service.dart';
import 'package:badal/model/notifcation_model/get_count_un_read_notifcation_model.dart';
import 'package:badal/model/notifcation_model/notification_model.dart';
import 'package:badal/model/products_model.dart';
import 'package:dio/dio.dart';

class UserNotificationsServices extends BaseHttpService {
  @override
  String get path => "Notifications";
  // SettingServices settingServices = Get.find();

  Future<NotificationModel> getNotifications(
      {required int pageNumber, required int pageSize}) async {
    try {
      var response = await get(
          params:
              "/GetByCustomerId?customerId=11&page=$pageNumber&pageSize=$pageSize");

      var res = await json.decode(json.encode(response.data));
      final model = NotificationModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<int> getCountForUnReadNotifcation() async {
    try {
      var response =
          await get(params: "/GetCountOfUnReadByCustomerId?customerId=11");

      var res = await json.decode(json.encode(response.data));
      final model = GetCountUnReadNotifcationModel.fromJson(res);

      return model.readByCustomerId;
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMessage> readNotification(
      {required int notificationId}) async {
    try {
      var response = await post(
        params: "/MakeIsRead?id=$notificationId",
        body: {},
      );

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res);
      log("model${model.statusCode}");

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addNotificationToServer({
    required String text,
    required String description,
    required String phoneNumber,
    required File? files,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "text": text,
        "description": description,
        "isRead": false,
        "phoneNumber": phoneNumber,
        "files": null,
        // "files":
        //     await MultipartFile.fromFile(files!.path, filename: 'upload.jpg'),
      });

      var response =
          await uploadImage(formData: formdata, params: '/AddWithPhoneNumber');

      var res = await json.decode(json.encode(response.data));

      log("model$res");
    } catch (error) {
      log("error addNotificationToServer :$error");
      rethrow;
    }
  }
}
