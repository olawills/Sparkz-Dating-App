import 'package:dating_app/app/core/network/dio_interceptors.dart';
import 'package:dio/dio.dart';

import '../services/api_url.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: const Duration(milliseconds: 20000),
      ),
    );
    dio.interceptors.add(DioInterceptor());
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    required String data,
    String? token,
  }) async {
    dio.options.headers = ApiConfig.header;
    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = ApiConfig.header;
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
