import 'package:dio/dio.dart';

import '../../../../../app/core/network/dio_interceptors.dart';
import '../../../../../app/core/services/api_url.dart';

class UserRemoteDataSource {
  UserRemoteDataSource({Dio? dio})
      : _dio = dio ?? Dio()
          ..interceptors.add(DioInterceptor())
          ..options.baseUrl = ApiConfig.baseUrl
          ..options.connectTimeout = const Duration(milliseconds: 20000)
          ..options.receiveTimeout = const Duration(milliseconds: 20000)
          ..options.sendTimeout = const Duration(milliseconds: 20000);
  final Dio _dio;

  Future<Response> getAllUsers() async => _dio.get('/user/getAllUsers');
}
