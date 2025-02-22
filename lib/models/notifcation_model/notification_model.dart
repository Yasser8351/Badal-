import 'package:badal/models/products_model.dart';

class NotificationModel {
  NotificationModel({
    required this.notifications,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<Notifications> notifications;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notifications = List.from(json['notifications'])
        .map((e) => Notifications.fromJson(e))
        .toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notifications'] = notifications.map((e) => e.toJson()).toList();
    data['responseMessage'] = responseMessage.toJson();
    // _data['totalCount'] = totalCount;
    // _data['totalPages'] = totalPages;
    // _data['currentPage'] = currentPage;
    return data;
  }
}

class Notifications {
  Notifications({
    required this.id,
    required this.text,
    required this.description,
    required this.imageURL,
    required this.isRead,
    // required this.customer,
    required this.customerId,
    required this.creationDate,
  });
  late final int id;
  late final String text;
  late final String description;
  late final String imageURL;
  late final bool isRead;
  // late final Customer customer;
  late final int customerId;
  late final String creationDate;

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    text = json['text'] ?? "";
    description = json['description'] ?? "";
    imageURL = json['imageURL'] ?? "";
    isRead = json['isRead'] ?? false;
    // customer = Customer.fromJson(json['customer']);
    customerId = json['customerId'] ?? 0;
    creationDate = json['creationDate'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['description'] = description;
    data['imageURL'] = imageURL;
    data['isRead'] = isRead;
    // _data['customer'] = customer.toJson();
    data['customerId'] = customerId;
    data['creationDate'] = creationDate;
    return data;
  }
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.username,
    required this.passowrd,
    required this.genderId,
    required this.email,
    required this.phone,
    required this.cityId,
    required this.customerImage,
    required this.isWalkinCustomer,
    required this.numOfShareApp,
    required this.isFavoriteStar,
  });
  late final int id;
  late final String name;
  late final String nameAR;
  late final String username;
  late final String passowrd;
  late final int genderId;
  late final String email;
  late final String phone;
  late final int cityId;
  late final String customerImage;
  late final bool isWalkinCustomer;
  late final int numOfShareApp;
  late final bool isFavoriteStar;

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    nameAR = json['nameAR'] ?? "";
    username = json['username'] ?? "";
    passowrd = json['passowrd'] ?? "";
    genderId = json['genderId'] ?? 0;
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    cityId = json['cityId'] ?? 0;
    customerImage = json['customerImage'] ?? "";
    isWalkinCustomer = json['isWalkinCustomer'] ?? false;
    numOfShareApp = json['numOfShareApp'] ?? 0;
    isFavoriteStar = json['isFavoriteStar'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAR'] = nameAR;
    data['username'] = username;
    data['passowrd'] = passowrd;
    data['genderId'] = genderId;
    data['email'] = email;
    data['phone'] = phone;
    data['cityId'] = cityId;
    data['customerImage'] = customerImage;
    data['isWalkinCustomer'] = isWalkinCustomer;
    data['numOfShareApp'] = numOfShareApp;
    data['isFavoriteStar'] = isFavoriteStar;
    return data;
  }
}
