import 'dart:io';

class ApiConfig {
  static final ApiConfig _apiConfig = ApiConfig._internal();

  //  ** Singleton
  factory ApiConfig() => _apiConfig;

  ApiConfig._internal();
  static const String baseUrl = 'https://spark-dating-api.onrender.com/api/v1';

  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const header = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
// https://meet.google.com/adw-kynw-kgh