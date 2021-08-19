

import 'package:get/get.dart';
import 'package:login_register/core/base_view_model.dart';
import 'package:login_register/models/featured_products_model.dart';
import 'package:login_register/models/network_response_model.dart';
import 'package:login_register/network_response/products_request.dart';

class FeaturedProductController extends BaseViewModel{

  NetworkResponseModel _products;
  NetworkResponseModel get products => _products;


  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future<void> getAllProducts() async {
    setBusy(true);
    print("ok");
    final response = await ProductsApi.getFeaturedProducts();
    _products = response;
    setBusy(false);


  }


}