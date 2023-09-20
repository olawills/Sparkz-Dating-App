import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/app/core/network_handler/failures.dart';
import 'package:dio/dio.dart';

import '../../../../app/core/network_handler/dio_exception.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepository({UserRemoteDataSourceImpl? userRemoteDataSource})
      : _userRemoteDataSource =
            userRemoteDataSource ?? UserRemoteDataSourceImpl();

  ResultFuture<UserList> getAllUsers() async {
    try {
      final response = await _userRemoteDataSource.getAllUsers();
      // final result = response
      //     .map((e) => User.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return Right(response);
    } on DioException catch (failure) {
      Log.error('HomeScreen error', failure.type);
      Log.debug(failure.message);
      final errorMessage = DioExceptions.fromDioError(failure);
      return failure.type == DioExceptionType.badResponse
          ? Left(ServerFailure(message: failure.message.toString()))
          : Left(ApiFailure.fromException(errorMessage));
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
