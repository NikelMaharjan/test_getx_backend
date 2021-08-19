

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/auth_controller.dart';
import 'package:login_register/widgets/custon_snackbar.dart';


class LoginScreen extends StatelessWidget {

   LoginScreen({Key key}) : super(key: key);

  AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildEmailField(),
              buildPasswordField(),
              SizedBox(height: 20,),
             buildSumbitButton(),
              buildRegisterButton(),
             /* GetBuilder<AuthController>(
                builder: (_){
                 return buildSumbitButton(_);
                },

              )*/
            ],
          ),
        ),
      )
    );
  }
  Widget buildEmailField() {
    return TextField(
      controller: authController.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Your email",
          hintText: "email@example.com",
          border: OutlineInputBorder()),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: authController.passwordController,
        decoration: InputDecoration(
            labelText: "Your password",
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
            ),
            hintText: '********',
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildSumbitButton() {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<AuthController>(builder: (_){
        return  ElevatedButton(
          onPressed: _.busy ? null : () async {
            final success = await _.login();
            if (success){
              Get.toNamed("/second");
            }
            else{
              CustomSnackbar.showCusotmSnackBar(message: _.errorMessage);
            }
          },
          child: _.busy ? CircularProgressIndicator() : Text("Submit"),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16)),
        );

      },)
    );
  }

  buildRegisterButton() {
    return Container(
      width: double.infinity,
        child: ElevatedButton(onPressed: (){
          Get.toNamed("/register");
        }, child: Text("Go to Register screen")));

  }
}
