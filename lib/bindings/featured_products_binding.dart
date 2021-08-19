

import 'package:get/get.dart';
import 'package:login_register/controller/featured_product_controller.dart';

class FeaturedProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FeaturedProductController>(() => FeaturedProductController());

  }

}
