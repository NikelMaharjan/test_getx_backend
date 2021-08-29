


import 'package:login_register/core/base_view_model.dart';
import 'package:login_register/models/network_response_model.dart';
import 'package:login_register/network_response/cart_request.dart';

class CartDisplayController extends BaseViewModel{

  NetworkResponseModel _carts;
  NetworkResponseModel get carts => _carts;

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }

  Future<void> getCartItem() async {
    print("Nikel maharjan");
    setBusy(true);
    final response = await CartRequest.getCartProducts();
    _carts = response;
    setBusy(false);
  }



  Future<void> removeFromCart(id) async{
   await CartRequest.removeFromCart(id);
   update();
  }

}