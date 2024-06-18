import 'dart:convert';

import 'package:badal/base_request/base_http_service.dart';

class SilderImageViewModel extends BaseHttpService {
  @override
  String get path => "Sliders";

  Future<dynamic> getSilderImage() async {
    // Future<List<Sliders>> getSilderImage() async {
    try {
      var response = await get(params: "?page=1&pageSize=5");

      var res = await json.decode(json.encode(response.data));
      // final model = ImageSlidersModel.fromJson(res);

      return res;
    } catch (error) {
      rethrow;
    }
  }
}
