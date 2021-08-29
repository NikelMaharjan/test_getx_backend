import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/bindings/add_cart_binding.dart';
import 'package:login_register/bindings/auth_binding.dart';
import 'package:login_register/bindings/cart_display_binding.dart';
import 'package:login_register/bindings/dashboard_binding.dart';
import 'package:login_register/bindings/featured_products_binding.dart';
import 'package:login_register/bindings/top_sales_binding.dart';
import 'package:login_register/screens/cart_screen.dart';
import 'package:login_register/screens/dashboard_screen.dart';
import 'package:login_register/screens/login_screen.dart';
import 'package:login_register/screens/featured_products_screen.dart';
import 'package:login_register/screens/product_detail_screen.dart';
import 'package:login_register/screens/signup_scree.dart';
import 'package:login_register/screens/splash_screen.dart';
import 'package:login_register/screens/top_sales_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/login", page: ()=>LoginScreen(), binding: AuthBinding()),
        GetPage(name: "/featuredProducts", page: ()=>FeaturedProductsScreen(), binding: FeaturedProductsBinding()),
        GetPage(name: "/topSalesProduct", page: ()=>TopSalesScreen(), binding: TopSalesBinding()),
        GetPage(name: "/register", page: ()=>SignupScreen(), binding: AuthBinding()),
        GetPage(name: "/detail", page: ()=>ProductDetailScreen(), binding: AddCartBinding(),),
        GetPage(name: "/cart", page: ()=>CartScreen(), binding: CartDisplayBinding()),
        GetPage(name: "/dashboard", page: ()=>DashBoardScreen(), binding: DashBoardBinding()),
        GetPage(name: "/", page: ()=>SplashScreen()),


      ],
    );
  }


}
