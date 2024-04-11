// import 'dart:convert';
// import 'dart:developer';

// import 'package:eysali/model/login_model.dart';

// import '../../base_request/base_http_service.dart';

// class AuthServices extends BaseHttpService {
//   ///
//   @override
//   String get path => "login";

//   Future<dynamic> userLogin({
//     required String username,
//     required String password,
//   }) async {
//     try {
//       var response = await post(
//         body: {
//           "username": username,
//           "password": password,
//         },
//       );

//       var res = await json.decode(json.encode(response.data));
//       var model = LoginModel.fromJson(res);
//       log("model $model");

//       return res;
//     } catch (error) {
//       log("error $error");

//       rethrow;
//     }
//   }
// }
