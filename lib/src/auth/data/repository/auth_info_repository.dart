import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/utils/typedef.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/app/core/network/failures.dart';
import 'package:dating_app/src/auth/data/datasource/auth_info_remote_datasource.dart';
import 'package:dating_app/src/auth/presentation/bloc/user_info_bloc/interest_bloc.dart';

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
    } on ServerFailure catch (e) {
      Log.error('Sending User Profile Error', e.message);
      return Left(e);
    }
  }
}
