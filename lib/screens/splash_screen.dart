

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/local/user_data_repository.dart';
import 'package:login_register/local/user_repository.dart';
import 'package:login_register/network_response/base_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  void callAsyncTask() async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository repository = UserRepository(prefs: sharedPreferences);


   String token = await repository.getAccessToken();

    print("Token isssss $token");

    baseRequest.setDefaultHeaders({"Authorization":"Bearer $token"});

    await Future.delayed(Duration(seconds: 3));
    bool isLoggedIn = await repository.isLoggedIn();
    if(token!=null){
   Get.offNamed("/dashboard");
    //Get.offNamed("/featuredProducts");
     // Get.offNamed("/topSalesProduct");
    }

    else{
      Get.offNamed("/login");
    }

  }

  @override
  Widget build(BuildContext context) {
    callAsyncTask();
    return Scaffold(
      body: Center(
        child: Text("This is splash Screen", style: Theme.of(context).textTheme.headline5,),
      )
    );
  }


}
