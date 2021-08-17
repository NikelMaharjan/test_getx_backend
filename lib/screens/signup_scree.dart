

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/auth_controller.dart';
import 'package:login_register/screens/second_screen.dart';

class SignupScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  SignupScreen({Key key}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildNameField(),
                  buildEmailField(),
                  buildPhoneField(),
                  buildAddressField(),
                  buildGenderField(),
                  buildDobField(),
                  buildPasswordField(),
                  buildConfirmPasswordField(),
                  SizedBox(height: 20,),
                  buildSumbitButton(),
                  /* GetBuilder<AuthController>(
                  builder: (_){
                   return buildSumbitButton(_);
                  },
                )*/
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget buildNameField() {
    return TextField(
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Your Name",
          border: OutlineInputBorder()),
    );
  }
  Widget buildEmailField() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Your email",
          border: OutlineInputBorder()),
    );
  }

  Widget buildPhoneField() {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: "Your phone",
          border: OutlineInputBorder()),
    );
  }

  Widget buildAddressField() {
    return TextField(
      controller: addressController,
      decoration: InputDecoration(
          labelText: "Your address",
          border: OutlineInputBorder()),
    );
  }

  Widget buildGenderField() {
    return TextField(
      controller: genderController,
      decoration: InputDecoration(
          labelText: "Your gneder",
          border: OutlineInputBorder()),
    );
  }

  Widget buildDobField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: dobController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            labelText: "Your DOB",
            border: OutlineInputBorder()),
      ),
    );
  }
  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
            labelText: "password",
            border: OutlineInputBorder()),
      ),
    );
  }
  Widget buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: confirmPasswordController,
        decoration: InputDecoration(
            labelText: "confirm password",
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
              final success = await _.register(
                  nameController.text,
                  phoneController.text,
                  emailController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                  addressController.text,
                  genderController.text,
                  dobController.text,
                  );
              if (success){
                Get.to(SecondScrenn());
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
}
