// site/privacy

import 'dart:convert';

import 'package:badal/base_request/base_http_service.dart';
import 'package:badal/models/faq_model.dart';

class FAQViewModel extends BaseHttpService {
  @override
  String get path => "questions";

  Future<List<FAQ>> getFAQ() async {
    try {
      var response = await get();

      var res = await json.decode(json.encode(response.data));
      final model = FAQModel.fromJson(res);

      return model.faq;
    } catch (error) {
      rethrow;
    }
  }
}
