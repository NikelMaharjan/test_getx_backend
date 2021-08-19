
class NetworkResponseModel {

  final bool status;
  final String message;
  dynamic data;

  NetworkResponseModel(
      { this.status, this.message, this.data});
}
