

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/dashboard_controller.dart';
import 'package:login_register/controller/featured_product_controller.dart';
import 'package:login_register/controller/top_sales_controller.dart';
import 'package:login_register/screens/cart_screen.dart';
import 'package:login_register/screens/featured_products_screen.dart';
import 'package:login_register/screens/top_sales_screen.dart';

class DashBoardScreen extends StatelessWidget {
   final screens = [FeaturedProductsScreen(), TopSalesScreen(), CartScreen()];
   DashBoardScreen({Key key}) : super(key: key);

  DashboardController dashboardController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Featured"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Top"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Carts"),

    ],
      onTap: dashboardController.changeTab,
      currentIndex:dashboardController.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: Colors.black87),
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 16),
      selectedLabelStyle: TextStyle(fontSize: 18),
      unselectedLabelStyle: TextStyle(fontSize: 16),
    );

  }

  Widget _buildBody() {
    return screens[dashboardController.currentIndex];
  }
}
