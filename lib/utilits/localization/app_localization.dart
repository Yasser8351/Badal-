import 'package:get/get.dart';

import '../app_config.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          AppConfig.appName: "بدل",
          AppConfig.home: "الرئيسية",
          AppConfig.favorite: "المفضلة",
          AppConfig.chat: "الرسائل",
          AppConfig.profile: "الملف الشخصي",
          AppConfig.settings: "الاعددات",

          ///////////////////////////////////////////////
          AppConfig.resetPassword: "استعادة كلمة المرور"
        },
        "en": {
          AppConfig.appName: AppConfig.appName,
          AppConfig.home: AppConfig.home,
          AppConfig.favorite: AppConfig.favorite,
          AppConfig.chat: AppConfig.chat,
          AppConfig.profile: AppConfig.profile,
          AppConfig.settings: AppConfig.settings,

          ///////////////////////////////////////////////
          AppConfig.resetPassword: AppConfig.resetPassword
        },
      };
}
/* 


*/