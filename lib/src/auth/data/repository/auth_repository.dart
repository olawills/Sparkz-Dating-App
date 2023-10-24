import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/src/auth/data/datasource/auth_remote_data_source.dart';
import 'package:dating_app/src/auth/data/models/login_response.dart';
import 'package:dating_app/src/auth/data/models/user.dart';
import 'package:dating_app/src/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../../app/core/network/dio_exception.dart';

class AuthRepository {
  AuthRepository({AuthRemoteDataSource? authRemoteDataSource})
      : _authRemoteDataSourceImpl =
            authRemoteDataSource ?? AuthRemoteDataSourceImpl();
  final AuthRemoteDataSource _authRemoteDataSourceImpl;

  ResultFuture<LoginResponse> login(LoginEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.loginUser(event);
      return Right(LoginResponse.fromJson(response.data));
    } catch (error) {
      Log.debug(error);
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<User> signup(SignupEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.createUser(event);
      debugPrint(response.data['user']);
      return Right(User.fromJson(response.data['user']));
    } catch (error) {
      debugPrint(error.toString());
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> verifyOtp(VerifyOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.verifyOtp(event);
      debugPrint(response.data);
      return Right(response.data);
    } catch (error) {
      debugPrint(error.toString());
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> resendOtp(ResendOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resendOtp(event);
      return Right(response.data['message']);
    } catch (error) {
      debugPrint(error.toString());
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> forgotPassword(ForgotPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.forgotPassword(event);
      return Right(response.data);
    } catch (error) {
      debugPrint(error.toString());
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> resetPassword(ResetPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resetPassword(event);
      return Right(response.data);
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  ResultFuture<String> logout(LogoutEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.logoutUsers();
      return Right(response.data);
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
