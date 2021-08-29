

import 'package:get/get.dart';
import 'package:login_register/controller/cart_display_controller.dart';
import 'package:login_register/controller/dashboard_controller.dart';
import 'package:login_register/controller/featured_product_controller.dart';
import 'package:login_register/controller/top_sales_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TopSalesController>(() => TopSalesController());
    Get.lazyPut<FeaturedProductController>(() => FeaturedProductController());
    Get.lazyPut<CartDisplayController>(() => CartDisplayController());

  }

}
