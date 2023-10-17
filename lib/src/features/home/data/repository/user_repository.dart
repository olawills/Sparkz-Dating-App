import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/src/auth/data/models/user.dart';

import '../../../../../app/core/core.dart';
import '../../../../../app/core/error/exception.dart';
import '../../../../../app/core/logger/app_logger.dart';
import '../../../../../app/core/network/dio_exception.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepository({UserRemoteDataSource? userRemoteDataSource})
      : _userRemoteDataSource =
            userRemoteDataSource ?? UserRemoteDataSourceImpl();

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
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> sendLocation(SendUserLocationEvent event) async {
    try {
      final response = await _userRemoteDataSource.sendUserLocation(event);
      return Right(response.data);
    } on ServerException catch (error) {
      Log.debug(error);
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
