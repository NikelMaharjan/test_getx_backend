import 'dart:convert';
import 'package:http/http.dart';


class _BaseRequest extends BaseClient {

  Map<String, String> _defaultHeaders;

  static final Client _httpClient = Client();

  _BaseRequest(this._defaultHeaders);

  void setDefaultHeaders(Map<String, String> headers) {
    _defaultHeaders = {..._defaultHeaders, ...?headers};
  }
  void clearHeaders() {
    _defaultHeaders = {"Content-Type": "application/json", "Accept": "application/json"};
  }

  @override
  Future<Response> post(url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    print("Body is $body");
    final response= await _httpClient.post(url,
        headers: _mergedHeaders(headers), body: body, encoding: encoding);
    return response;
  }
  
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request..headers.addAll(_defaultHeaders);
    final response = await _httpClient.send(request);
    return response;
  }
  @override
  Future<Response> get(url, {Map<String, String> headers}) async {
    final response= await _httpClient.get(url, headers: _mergedHeaders(headers));
    return response;
  }

  @override
  Future<Response> patch(url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    final response= await _httpClient.patch(url,
        headers: _mergedHeaders(headers), body: body, encoding: encoding);

    return response;
  }
  @override
  Future<Response> put(url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    final response= await _httpClient.put(url,
        headers: _mergedHeaders(headers), body: body, encoding: encoding);
    return response;
  }
  @override
  Future<Response> head(url, {Map<String, String> headers}) async {
    final response= await _httpClient.head(url, headers: _mergedHeaders(headers));
    return response;
  }
  @override
  Future<Response> delete(Uri url,
      {Map<String, String> headers, Object body, Encoding encoding}) async {
    final response=  await _httpClient.delete(url, headers: _mergedHeaders(headers));
    return response;
  }
  Map<String, String> _mergedHeaders(Map<String, String> headers) =>
      {..._defaultHeaders, ...?headers};
}
final baseRequest = _BaseRequest({"Content-Type": "application/json"});