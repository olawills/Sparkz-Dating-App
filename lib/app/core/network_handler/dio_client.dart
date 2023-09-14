import 'package:dating_app/app/core/network_handler/dio_interceptors.dart';
import 'package:dating_app/app/core/services/api_url.dart';
import 'package:dio/dio.dart' show Dio, ResponseType;

class DioClient {
  final Dio dio;
  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      ..options.contentType = 'application/json; charset=utf-8'
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
  }
}
