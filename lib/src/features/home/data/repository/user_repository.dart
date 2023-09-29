import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/src/auth/data/models/user.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/dio_exception.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepository({UserRemoteDataSourceImpl? userRemoteDataSource})
      : _userRemoteDataSource =
            userRemoteDataSource ?? UserRemoteDataSourceImpl();

  ResultFuture<UserList> getAllUsers() async {
    try {
      final response = await _userRemoteDataSource.getAllUsers();
      // UserList users = [];
      // users = (json.decode(response.data) as List)
      //     .map((data) => User.fromJson(data))
      //     .toList();
      final UserList users = UserList.from(
        response.data['user'].map(
          (json) => User.fromJson(json),
        ),
      );
      Log.debug(response);
      return Right(users);
    } on DioException catch (e) {
      Log.error('HomeScreen error', e.type);
      Log.debug(e.message);
      return e.type == DioExceptionType.badResponse
          ? Left(e.response!.data)
          : Left(DioErrorHandler.handleDioError(e));
    }
  }
}
