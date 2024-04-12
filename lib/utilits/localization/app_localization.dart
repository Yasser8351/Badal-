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
          AppConfig.email: "الايميل",
          AppConfig.fullName: "الاسم بالكامل",
          AppConfig.password: "كلمة المرور",
          AppConfig.login: "تسجيل الدخول",
          AppConfig.register: "انشاء حساب",
          AppConfig.dontHaveAccount: "ليس لديك حساب؟",
          AppConfig.alreadyHaveAccount: "لديك حساب مسبق؟",
          AppConfig.searchHint: "ابحث عن ...",
          AppConfig.timeOut: "يبدو ان اتصال الانترنت لديك ضعيف",
          AppConfig.noInternet: "لايوجد اتصال بالانترنت",
          AppConfig.noDataFound: "لايوجد بيانات",
          AppConfig.curancy: "ريال",
          AppConfig.tryAgain: "اعادة المحاولة",
          AppConfig.somthimgWroing: "حدث خطأ",

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
          AppConfig.email: AppConfig.email,
          AppConfig.tryAgain: AppConfig.tryAgain,
          AppConfig.fullName: AppConfig.fullName,
          AppConfig.password: AppConfig.password,
          AppConfig.login: AppConfig.login,
          AppConfig.register: AppConfig.register,
          AppConfig.dontHaveAccount: AppConfig.dontHaveAccount,
          AppConfig.alreadyHaveAccount: AppConfig.alreadyHaveAccount,
          AppConfig.searchHint: AppConfig.searchHint,
          AppConfig.curancy: AppConfig.curancy,

          AppConfig.timeOut: AppConfig.timeOut,
          AppConfig.noInternet: AppConfig.noInternet,
          AppConfig.noDataFound: AppConfig.noDataFound,
          AppConfig.somthimgWroing: AppConfig.somthimgWroing,

          ///////////////////////////////////////////////
          AppConfig.resetPassword: AppConfig.resetPassword
        },
      };
}
/* 


*/