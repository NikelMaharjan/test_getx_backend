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

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<bool> login(String email, String password) async {
    print("email is $email and password is $password");
    setBusy(true);
    try {
      final token = await AuthRequest.login(email, password);
      setBusy(false);
      return saveUserInstance(token);
    }
    catch (e) {
      _errorMessage = "$e".replaceAll("Exception:", "");
      print('Exception is=== $e');
      return false;
    }
  }

  Future<bool> register(String name, String email, String phone, String address, String gender, String dob, String password, String confirmpassword) async {
    setBusy(true);
    try {
      String token = await AuthRequest.register(name, email, phone, address, gender, dob, password, confirmpassword);
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
    UserRepository userRepository = UserRepository(prefs: _sharedPreferences);
    try{
      await userRepository.login(token);
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
