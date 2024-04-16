class ProductsModel {
  ProductsModel({
    required this.products,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<Products> products;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['products'] = products.map((e) => e.toJson()).toList();
    data['responseMessage'] = responseMessage.toJson();
    return data;
  }
}

class Products {
  Products({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.description,
    required this.descriptionAR,
    required this.price,
    required this.discount,
    required this.subCategoryId,
    required this.productImage,
  });
  late final int id;
  late final String name;
  late final String nameAR;
  late final String description;
  late final String descriptionAR;
  late final int price;
  late final int discount;
  late final int subCategoryId;
  late final String productImage;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    nameAR = json['nameAR'] ?? "";
    description = json['description'] ?? "";
    descriptionAR = json['descriptionAR'] ?? "";
    price = json['price'] ?? 0;
    discount = json['discount'] ?? 0;
    subCategoryId = json['subCategoryId'] ?? 0;
    productImage = json['productMainImage'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAR'] = nameAR;
    data['description'] = description;
    data['descriptionAR'] = descriptionAR;
    data['price'] = price;
    // _data['isPercentage'] = isPercentage;
    data['subCategoryId'] = subCategoryId;
    data['productImage'] = productImage;
    return data;
  }
}

class ResponseMessage {
  ResponseMessage({
    required this.statusCode,
    required this.messageEN,
    required this.messageAR,
  });
  late int statusCode;
  late String messageEN;
  late String messageAR;

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] ?? 0;
    messageEN = json['messageEN'] ?? "";
    messageAR = json['messageAR'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['messageEN'] = messageEN;
    data['messageAR'] = messageAR;
    return data;
  }
}
