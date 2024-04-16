class PrivacyPolicyModel {
  PrivacyPolicyModel({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.privacyPolicy,
  });
  late final List<PrivacyPolicy> privacyPolicy;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    privacyPolicy = List.from(json['privacy'])
        .map((e) => PrivacyPolicy.fromJson(e))
        .toList();
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }
}

class PrivacyPolicy {
  PrivacyPolicy({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String description;
  final String createdAt;
  final String updatedAt;

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
        id: json["id"] ?? '',
        description: json["description"] ?? '',
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
