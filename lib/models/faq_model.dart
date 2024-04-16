class FAQModel {
  FAQModel({
    required this.faq,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<FAQ> faq;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  FAQModel.fromJson(Map<String, dynamic> json) {
    faq = List.from(json['faq']).map((e) => FAQ.fromJson(e)).toList();
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }
}

class FAQ {
  FAQ({
    this.id = '',
    this.question = '',
    this.answer = '',
    this.orderNo = 0,
    this.createdAt = '',
    this.updatedAt = '',
  });

  String id;
  String question;
  String answer;
  int orderNo;
  String createdAt;
  String updatedAt;

  factory FAQ.fromJson(Map<String, dynamic> json) => FAQ(
        id: json["id"] ?? '',
        question: json["question"] ?? '',
        answer: json["answer"],
        orderNo: json["order_no"] ?? '',
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "order_no": orderNo,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
