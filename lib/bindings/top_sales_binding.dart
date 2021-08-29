

import 'package:get/get.dart';
import 'package:login_register/controller/top_sales_controller.dart';

class TopSalesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TopSalesController>(() => TopSalesController());

  }

}
