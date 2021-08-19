import 'dart:convert';

import 'package:login_register/network_response/base_request.dart';

import '../core/app_url.dart';

class AuthRequest{

  static Future<String> login(String email, String password) async {
    print('i am in login');
    final requestBody = jsonEncode({
      "email": email,
      "password": password,
    });
    try {
      var uri = Uri.parse(AppUrl.LOGIN_URL);
      print("email is $email and password is $password");
      final response = await baseRequest.post(
        uri,
        body: requestBody,
      );
      final body = response.body;
      print("login response $body");
      final parsed = jsonDecode(body);   //do JSONDECODE in Base Request
      if(parsed["access_token"]==null){
        throw Exception(parsed["error"]?? "Could not login with credential provided");    //all exception thrown will be catched by catch block
      }
      return parsed["access_token"];
    } catch (e) {
      print("login exception $e");
      // throw Exception("$e");   //dont and no need to use throw here
      return Future.error('$e');
    }
  }


 static Future<String> register(String name, String phone, String email, String password, String confirmPassword, String address, String gender, String dob) async {
    print('i am in signup');
    final requestBody = jsonEncode({
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "gender": gender,
      "dob": dob,
      "password": password,
      "password_confirmation": confirmPassword,
    });
    try {

      var uri = Uri.parse(AppUrl.REGISTER_URL);
      final response = await baseRequest.post(
        uri,
        body: requestBody,
      );
      final body = response.body;
      print("bodyyyyyy is $body");
      print("Signup response $body");
      final parsed = jsonDecode(body);  //do JSONDECODE in Base Request
      if (parsed["access_token"] == null) {
        throw Exception(
            parsed["error"] ?? "Could not Register with the credential provided");
      }
      return parsed["access_token"];
    } catch (e) {
      print("Sigup exception $e");
      throw Exception("$e");
    }
  }

}