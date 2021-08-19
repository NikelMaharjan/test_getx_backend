


import 'package:get/get.dart';
import 'package:login_register/controller/cart_contorller.dart';
import 'package:login_register/controller/cart_display_controller.dart';

class CartDisplayBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartDisplayController>(() => CartDisplayController());

  }

}
