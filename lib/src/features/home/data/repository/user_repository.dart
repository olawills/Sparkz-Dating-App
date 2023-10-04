import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/src/auth/data/models/user.dart';

import '../../../../../app/core/network/failures.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepository({UserRemoteDataSource? userRemoteDataSource})
      : _userRemoteDataSource = userRemoteDataSource ?? UserRemoteDataSource();

  ResultFuture<UserList> getAllUsers() async {
    try {
      final response = await _userRemoteDataSource.getAllUsers();
      if (response.statusCode == 200) {
        final UserList users = UserList.from(
          response.data['user'].map(
            (json) => User.fromJson(json),
          ),
        );

        return Right(users);
      }
      return Right(response.data);
    } on ServerFailure catch (e) {
      Log.error('HomeScreen error', e.message);
      return Left(e);
    }
  }
}
