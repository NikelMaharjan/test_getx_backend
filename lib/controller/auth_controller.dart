import 'package:flutter/material.dart';
import 'package:login_register/local/user_data_repository.dart';
import 'package:login_register/local/user_repository.dart';
import 'package:login_register/network_response/auth_request.dart';
import 'package:login_register/core/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends BaseViewModel {

  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  UserRepository _userRepository;
  SharedPreferences _sharedPreferences;
  UserDataRepository _userDataRepository;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get genderController => _genderController;
  TextEditingController get dobController => _dobController;
  TextEditingController get addressController => _addressController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  Future<bool> login() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 5));
    try {
      setBusy(false);
      final token = await AuthRequest.login(_emailController.text, _passwordController.text).catchError((error) {
        print('Error occured. $error');   //no need to write network response mode doing this??
      });
      return saveUserInstance(token);
    }
    catch (e) {
      _errorMessage = "$e".replaceAll("Exception:", "");
      print('Exception is=== $e');
      return false;
    }
  }

  Future<bool> register() async {
    setBusy(true);
    try {
      String token = await AuthRequest.register(
          _nameController.text,
          _emailController.text,
          _phoneController.text,
          _addressController.text,
          _genderController.text,
          _dobController.text,
          _passwordController.text,
          _confirmPasswordController.text);
      setBusy(false);
      return saveUserInstance(token);
     // baseRequest.setDefaultHeaders({"Authorization": token});

    } catch (e) {
      _errorMessage = "$e".replaceAll("Exception:", "");
      return false;
    }
  }

  Future<bool> saveUserInstance(String token) async {
     _sharedPreferences = await SharedPreferences.getInstance();
     _userRepository = UserRepository(prefs: _sharedPreferences);
    try{
      await _userRepository.login(token);
      return true;
    }
    catch(e){
      _errorMessage = "$e".replaceAll("Exception:", "");
      return false;
    }
  }



   initializeData() async {
    print("this is called");
    _sharedPreferences = await SharedPreferences.getInstance();
    _userDataRepository = UserDataRepository.instance;
    _userRepository = UserRepository(prefs: _sharedPreferences);
    String token = await _userRepository.getAccessToken();
    _userDataRepository.setAccessToken(token);

   }

}
