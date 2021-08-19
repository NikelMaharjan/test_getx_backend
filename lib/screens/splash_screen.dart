

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/local/user_data_repository.dart';
import 'package:login_register/local/user_repository.dart';
import 'package:login_register/network_response/base_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  void callAsyncTask() async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserDataRepository userDataRepository = UserDataRepository.instance;
    UserRepository repository = UserRepository(prefs: sharedPreferences);

   String token = await repository.getAccessToken();
    //String token = UserDataRepository.instance.accessToken;
   // userDataRepository.setAccessToken(token);

    print("Token isssss $token");

    //setDefaultHeaders({"x-auth-token":token});

    baseRequest.setDefaultHeaders({"Authorization":"Bearer $token"});

    await Future.delayed(Duration(seconds: 3));
    bool isLoggedIn = await repository.isLoggedIn();
    if(isLoggedIn){
      Get.offNamed("/second");
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
