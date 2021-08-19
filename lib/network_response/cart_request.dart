
import 'dart:convert';

import 'package:login_register/core/app_url.dart';
import 'package:login_register/models/cart_item_model.dart';
import 'package:login_register/models/network_response_model.dart';
import 'package:login_register/network_response/base_request.dart';

class CartRequest{

  static Future<NetworkResponseModel> addToCart (int productId) async{

    try{
      final uri = Uri.parse(AppUrl.ADD_CART);
      final response = await baseRequest.post(uri,              //post hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
        body: jsonEncode({"product_id":productId}),
      );
      final body = jsonDecode(response.body);   //do JSON DECODE IN NETWORK RESPONSE MODEL LATER
      print("aad to cart $body");
      if(body["cart"] == null){
        return NetworkResponseModel(status: false);
      }
      return NetworkResponseModel(status: true);
    }
    catch(e){
      print("The add to cart exception $e");
      return NetworkResponseModel(status: false, message: e);
    }

  }

  static Future<NetworkResponseModel> getCartProducts() async {

    try{
      final uri = Uri.parse(AppUrl.GET_CART_ITEM);
      final response = await baseRequest.get(uri);
      final body = jsonDecode(response.body);   //do JSON DECODE IN NETWORK RESPONSE MODEL
      print("list of cart $body");
      final list = cartItemModel.fromJson(body["cart"]);  //ne need to .allResponse since its already in list??
      return NetworkResponseModel(status: true, data: list);
    }
    catch(e){
      print("The cart item exception $e");
    }

  }


}