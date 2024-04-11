import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  ///
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  /// loading State types
  LoadingState loadingStateLogin = LoadingState.initial;

  /// login Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// var
  bool hidePassword = true;

  ///////// methode helper /////////
  changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }

  IconData getIconPassword(hidePassword) {
    if (hidePassword) {
      return CupertinoIcons.eye;
    } else {
      return CupertinoIcons.eye_slash;
    }
  }

  Color? getColorIconPassword(hidePassword) {
    if (hidePassword) {
      return null;
    } else {
      return kcPrimary;
    }
  }
}
