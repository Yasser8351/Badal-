import 'package:badal/controller/auth_controller/auth_controller.dart';
import 'package:badal/controller/notification_controller/user_notification_controller.dart';
import 'package:badal/controller/product_controller/add_product_controller.dart';
import 'package:badal/controller/products_controller.dart';
import 'package:get/get.dart';

class BinindingApp implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(AddProductController());
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.lazyPut(() => UserNotificationController(), fenix: true);
  }
}
