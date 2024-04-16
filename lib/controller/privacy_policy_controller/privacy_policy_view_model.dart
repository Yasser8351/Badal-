//

import 'dart:convert';

import 'package:badal/base_request/base_http_service.dart';
import 'package:badal/models/privacy_policy_model.dart';

class PrivacyPolicyViewModel extends BaseHttpService {
  @override
  String get path => "site";

  Future<List<PrivacyPolicy>> getPrivacyPolicy() async {
    try {
      var response = await get();

      var res = await json.decode(json.encode(response.data));
      final model = PrivacyPolicyModel.fromJson(res);

      return model.privacyPolicy;
    } catch (error) {
      rethrow;
    }
  }
}
