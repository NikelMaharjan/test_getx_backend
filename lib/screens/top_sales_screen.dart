

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/top_sales_controller.dart';
import 'package:login_register/models/featured_products_model.dart';
import 'package:login_register/widgets/error_view.dart';
import 'package:login_register/widgets/loading_indicatior.dart';
import 'package:login_register/widgets/product_item.dart';

class TopSalesScreen extends StatelessWidget {
  TopSalesScreen({Key key}) : super(key: key);

  TopSalesController topSalesController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<TopSalesController>(
          builder: (_){
            if(_.busy){
              return LoadingIndicator();
            }
            if(_.products.status == false){
              return ErrorView(
                messages: _.products.message,
                callback: () async => _.getAllProducts(),
              );
            }
            return ListView.builder(
                itemCount: _.products.data.length,
                itemBuilder: (BuildContext context, int index){
                  final FeaturedProductsModel products = _.products.data[index] as FeaturedProductsModel;
                  return ProductItem(products: products,);
                });
          },

        )
    );
  }
}

