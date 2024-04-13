import 'package:badal/model/products_model.dart';

class GetCountUnReadNotifcationModel {
  GetCountUnReadNotifcationModel({
    required this.readByCustomerId,
    required this.responseMessage,
  });
  late final int readByCustomerId;
  late final ResponseMessage responseMessage;

  GetCountUnReadNotifcationModel.fromJson(Map<String, dynamic> json) {
    readByCustomerId = json['readByCustomerId'] ?? 0;
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['readByCustomerId'] = readByCustomerId;
    data['responseMessage'] = responseMessage.toJson();
    return data;
  }
}
