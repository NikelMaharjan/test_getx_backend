

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/cart_contorller.dart';
import 'package:login_register/models/featured_products_model.dart';
import 'package:login_register/widgets/custon_snackbar.dart';

class ProductDetailScreen extends StatelessWidget {
   ProductDetailScreen({Key key}) : super(key: key);
   CartController cartController = Get.find();


  FeaturedProductsModel product = FeaturedProductsModel();

  getArguments(){
    final arguments = Get.arguments;
    product = arguments[0];
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Html(data: product.description),
              ElevatedButton(onPressed: (){
                _cartAdd(product.id);
              }, child: Text("Add to Cart")),
              ElevatedButton(onPressed: (){
                _viewCart();
              }, child: Text("View Your Cart"))
            ],
          ),
        ),
      ),
    );
  }

  void _cartAdd(id) {
    cartController.addToCart(id);
    CustomSnackbar.showCusotmSnackBar(message: "Successfully added to cart");

  }

  void _viewCart() {
    Get.toNamed("/cart");
  }
}
