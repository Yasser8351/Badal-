// import 'package:otobath_customer/models/response_message_model.dart';

/// http://84.46.253.59:8024/api/v1/Sliders?page=1&pageSize=10

class ImageSlidersModel {
  ImageSlidersModel({
    this.sliders = const [],
    // this.responseMessage,
    this.totalCount = 0,
    this.totalPages = 0,
    this.currentPage = 0,
  });
  late final List<Sliders> sliders;
  // late final ResponseMessage? responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  ImageSlidersModel.fromJson(Map<String, dynamic> json) {
    sliders =
        List.from(json['sliders']).map((e) => Sliders.fromJson(e)).toList();
    // responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }
}

class Sliders {
  Sliders({
    required this.id,
    required this.title,
    required this.isActive,
    required this.imageURL,
  });
  late final int id;
  late final String title;
  late final bool isActive;
  late final String imageURL;

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    isActive = json['isActive'] ?? false;
    imageURL = json['imageURL'] ?? '';
  }
}
