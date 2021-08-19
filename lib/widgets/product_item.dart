
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/models/featured_products_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    @required this.products,
  }) : super(key: key);

  final FeaturedProductsModel products;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Get.toNamed("/detail", arguments: [products]);
      },
      title: Text(products.name),
      subtitle: Text("Rs: ${products.brand}"),
    );
  }
}