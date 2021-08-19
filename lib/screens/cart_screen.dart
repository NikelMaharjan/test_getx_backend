

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/cart_contorller.dart';
import 'package:login_register/controller/cart_display_controller.dart';
import 'package:login_register/models/cart_item_model.dart';
import 'package:login_register/widgets/error_view.dart';
import 'package:login_register/widgets/loading_indicatior.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key key}) : super(key: key);
  CartDisplayController cartDisplayController = Get.find();

  @override
  Widget build(BuildContext context) {
    //cartController.getCartItem();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body:/* Center(
        child: Text("This is cart screen"),
      )*/
       GetBuilder<CartDisplayController>(
        builder: (_){
          if(_.busy){
            return LoadingIndicator();
          }
     /*     if(_.carts.status == false){
            return ErrorView(
              messages: _.carts.message,
              callback: () async => _.getCartItem(),
            );
          }*/
          return ListView.builder(
              itemCount: _.carts.data.cartItem.length,
              itemBuilder: (BuildContext context, int index){
                final  products = _.carts.data.cartItem[index];
                return ListTile(
                  title: Text(products.product.name),
                );
              });

        },

      ),
    );
  }
}
