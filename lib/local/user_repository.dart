

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences prefs;

  UserRepository({this.prefs});

  static const String _ACCESS_TOKEN = "accessToken";
  static const String _IS_LOGGED_IN = "is_logged_in";
  static const String _APP_LAUNCHED_PREVIOUSLY = "is_app_launched_previously";


  appLaunched() async {
    await prefs.setBool(_APP_LAUNCHED_PREVIOUSLY, false);
  }

  login(String accessToken) async {
    print("Token is $accessToken");
    await prefs.setBool(_IS_LOGGED_IN, true);   //here directly check...if token arrived, isLoggedin is set to true
    await prefs.setString(_ACCESS_TOKEN, accessToken);
  }

  Future<bool> isLoggedIn() async {      //hereeee
    return prefs.containsKey(_IS_LOGGED_IN);
  }

  Future<String> getAccessToken() async {
    return prefs.getString(_ACCESS_TOKEN);
  }

  Future<bool> isAppLaunchedPreviously() async {
    return prefs.containsKey(_APP_LAUNCHED_PREVIOUSLY);
  }

}