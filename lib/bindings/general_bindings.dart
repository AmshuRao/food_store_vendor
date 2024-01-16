
import 'package:food_store/features/authentication/screens/orders/order_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}