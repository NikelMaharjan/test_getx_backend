

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/auth_controller.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginScreen({Key key}) : super(key: key);

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
      controller: emailController,
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
        controller: passwordController,
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
            final success = await _.login(emailController.text, passwordController.text);
            if (success){
              Get.toNamed("/second");
            }
            else{
              Get.snackbar("Error", _.errorMessage);
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
