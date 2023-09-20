import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/utils/typedef.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/app/core/network_handler/dio_exception.dart';
import 'package:dating_app/app/core/network_handler/failures.dart';
import 'package:dating_app/presentation/auth/data/datasource/auth_info_remote_datasource.dart';
import 'package:dating_app/presentation/auth/presentation/bloc/user_info_bloc/interest_bloc.dart';
import 'package:dio/dio.dart';

class AuthInfoRepository {
  AuthInfoRepository(
      {AuthInfoRemoteDataSourceImpl? authInfoRemoteDataSourceImpl})
      : _authInfoRemoteDataSourceImpl =
            authInfoRemoteDataSourceImpl ?? AuthInfoRemoteDataSourceImpl();
  final AuthInfoRemoteDataSourceImpl _authInfoRemoteDataSourceImpl;

  ResultFuture<String> userProfile(CreateUserProfile event) async {
    try {
      final response =
          await _authInfoRemoteDataSourceImpl.createUserProfile(event);
      return Right(response.toString());
    } on DioException catch (failure) {
      Log.error('Sending User Profile Error', failure.type);
      final errorMessage = DioExceptions.fromDioError(failure).toString();
      return Left(ServerFailure(message: errorMessage));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
