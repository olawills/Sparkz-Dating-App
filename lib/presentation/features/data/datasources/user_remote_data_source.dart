import 'package:dating_app/injection_container.dart';

import '../../../../app/core/network_handler/dio_client.dart';
import '../../../auth/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getAllUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<User>> getAllUsers() async {
    final DioClient dioClient = di<DioClient>();
    final response = await dioClient.dio.get('/user/getAllUsers');
    return response.data as List<User>;
  }
}
