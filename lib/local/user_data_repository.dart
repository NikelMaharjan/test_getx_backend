

class UserDataRepository {

  UserDataRepository._privateConstructor();

  static final UserDataRepository _instance = UserDataRepository._privateConstructor();

  static UserDataRepository get instance => _instance;

  String _accessToken;


  String get accessToken => _accessToken;


  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }


}
