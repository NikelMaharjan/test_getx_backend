

import 'package:get/get.dart';
import 'package:login_register/core/base_view_model.dart';
import 'package:login_register/models/network_response_model.dart';
import 'package:login_register/network_response/cart_request.dart';

class CartController extends BaseViewModel{
/*

  NetworkResponseModel _carts;
  NetworkResponseModel get carts => _carts;
*/

/*  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }*/

  Future<NetworkResponseModel> addToCart (int id) async {
    print("Add to cart");
    final response = await CartRequest.addToCart(id);;
    return response;
  }

/*  Future<void> getCartItem() async {
    print("Nikel maharjan");
    setBusy(true);
    final response = await CartRequest.getCartProducts();
    _carts = response;
    setBusy(false);
  }*/

}