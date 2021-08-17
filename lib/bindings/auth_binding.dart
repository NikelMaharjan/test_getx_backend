

import 'package:get/get.dart';
import 'package:login_register/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());

  }

}
