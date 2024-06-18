import 'package:badal/controller/auth_controller/auth_controller.dart';
import 'package:badal/controller/category_and_city_controller.dart';
import 'package:badal/controller/faq_controller/faq_controller.dart';
import 'package:badal/controller/notification_controller/user_notification_controller.dart';
import 'package:badal/controller/privacy_policy_controller/privacy_policy_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/controller/products_controller.dart';
import 'package:badal/controller/slider_image_controller/slider_image_controller.dart';
import 'package:get/get.dart';

class BinindingApp implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(SliderImageController());
    Get.put(CategoryAndCityController());
    Get.put(AddProductController());
    Get.put(FAQController());
    Get.put(PrivacyPolicyController());
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.lazyPut(() => UserNotificationController(), fenix: true);
  }
}
