
import 'dart:convert';

import 'package:login_register/core/app_url.dart';
import 'package:login_register/models/featured_products_model.dart';
import 'package:login_register/models/network_response_model.dart';
import 'package:login_register/network_response/base_request.dart';

class ProductsApi {

  static Future<NetworkResponseModel> getFeaturedProducts() async{

    try{
      final uri = Uri.parse(AppUrl.FEATURED_PRODUCTS);
      final response = await baseRequest.get(uri);
      final body = jsonDecode(response.body);   ////////////////////////  do JSONDECODE IN BASE REQUESTTT
      final productsresponse = body["featuredProducts"];
      print("List of products $body");
      final list = FeaturedProductsModel.allResponse(productsresponse);
      return NetworkResponseModel(status: true, data: list);
    }

    catch(e){
      print("The featured products exception $e");
      return NetworkResponseModel(status: false, message: "Error $e");
    }


  }
  static Future<NetworkResponseModel> getTopSalesProducts() async{

    try{
      final uri = Uri.parse(AppUrl.TOP_SALES);
      final response = await baseRequest.get(uri);
      final body = jsonDecode(response.body);
      final productsresponse = body["topSales"];
      print("List of top sales $body");
      final list = FeaturedProductsModel.allResponse(productsresponse);
      return NetworkResponseModel(status: true, data: list);
    }

    catch(e){
      print("The featured products exception $e");
      return NetworkResponseModel(status: false, message: "Error $e");
    }


  }


}