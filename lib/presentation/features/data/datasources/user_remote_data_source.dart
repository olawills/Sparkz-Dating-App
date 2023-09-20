import 'package:dating_app/app/common/utils/typedef.dart';
import 'package:dating_app/injection_container.dart';

import '../../../../app/core/network_handler/dio_client.dart';
import '../../../auth/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<UserList> getAllUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient dioClient = serviceLocator<DioClient>();

  @override
  Future<UserList> getAllUsers() async {
    final response = await dioClient.dio.get('/user/getAllUsers');
    if (response.statusCode == 200) {
      return UserList.from(
          (response.data as UserList).map((e) => User.fromJson(e as DataMap)));
    }
    return response.data;
  }
}

