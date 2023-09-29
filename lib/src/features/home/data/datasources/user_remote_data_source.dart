import 'package:dating_app/injection_container.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/dio_client.dart';


abstract class UserRemoteDataSource {
  Future<Response> getAllUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient dioClient = serviceLocator<DioClient>();

  @override
  Future<Response> getAllUsers() async {
    final response = dioClient.dio.get('/user/getAllUsers');
    return response;
  }
}
