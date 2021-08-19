


import 'package:get/get.dart';
import 'package:login_register/controller/cart_contorller.dart';

class AddCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());

  }

}
