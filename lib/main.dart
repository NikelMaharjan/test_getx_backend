import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/bindings/auth_binding.dart';
import 'package:login_register/controller/auth_controller.dart';
import 'package:login_register/screens/login_screen.dart';
import 'package:login_register/screens/second_screen.dart';
import 'package:login_register/screens/signup_scree.dart';
import 'package:login_register/screens/splash_screen.dart';

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
        GetPage(name: "/", page: ()=>LoginScreen(), binding: AuthBinding()),
        GetPage(name: "/second", page: ()=>SecondScrenn(), binding: AuthBinding()),
        GetPage(name: "/register", page: ()=>SignupScreen(), binding: AuthBinding(),),
        GetPage(name: "/splash", page: ()=>SplashScreen(), binding: AuthBinding(),),


      ],
    );
  }


}
