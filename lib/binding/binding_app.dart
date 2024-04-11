import 'package:badal/controller/auth_controller/auth_controller.dart';
import 'package:badal/controller/products_controller.dart';
import 'package:get/get.dart';

class BinindingApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.put(AuthController());
  }
}
