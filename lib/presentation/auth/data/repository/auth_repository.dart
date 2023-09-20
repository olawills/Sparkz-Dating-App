import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/app/core/network_handler/dio_exception.dart';
import 'package:dating_app/app/core/network_handler/failures.dart';
import 'package:dating_app/presentation/auth/data/datasource/auth_remote_data_source.dart';
import 'package:dating_app/presentation/auth/data/models/login_response.dart';
import 'package:dating_app/presentation/auth/data/models/user.dart';
import 'package:dating_app/presentation/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:dio/dio.dart';

class AuthRepositories {
  AuthRepositories({AuthRemoteDataSourceImpl? authRemoteDataSourceImpl})
      : _authRemoteDataSourceImpl =
            authRemoteDataSourceImpl ?? AuthRemoteDataSourceImpl();
  final AuthRemoteDataSourceImpl _authRemoteDataSourceImpl;

  ResultFuture<LoginResponse> login(LoginEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.loginUser(event);
      return Right(LoginResponse.fromJson(response.data));
    } on DioException catch (failure) {
      Log.error('login error', failure.type);
      final errorMessage = DioExceptions.fromDioError(failure).toString();
      return failure.type == DioExceptionType.badResponse
          ? Left(ServerFailure(message: failure.message.toString()))
          : Left(ServerFailure(message: errorMessage));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  ResultFuture<User> signup(SignupEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.createUser(event);
      Log.debug(response.data['user']);
      return Right(User.fromJson(response.data['user']));
    } on DioException catch (failure) {
      Log.error('Signup error', failure.type);
      Log.debug(failure.message);
      final errorMessage = DioExceptions.fromDioError(failure);
      return failure.type == DioExceptionType.badResponse
          ? Left(ServerFailure(message: failure.message.toString()))
          : Left(ApiFailure.fromException(errorMessage));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  ResultFuture<String> verifyOtp(VerifyOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.verifyOtp(event);
      print(response.data);
      return Right(response.data['message'].toString());
    } on DioException catch (failure) {
      Log.error('Signup error', failure.type);
      final errorMessage = DioExceptions.fromDioError(failure).toString();
      return failure.type == DioExceptionType.badResponse
          ? Left(ServerFailure(
              message: failure.response!.data['message'].toString(),
            ))
          : Left(ServerFailure(message: errorMessage));
    }
  }

  ResultFuture<dynamic> resendOtp(ResendOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resendOtp(event);
      return Right(response);
    } on DioException catch (failure) {
      Log.error('Resend Otp error', failure.type);
      final errorMessage = DioExceptions.fromDioError(failure).toString();
      return failure.type == DioExceptionType.badResponse
          ? Left(ServerFailure(
              message: failure.response!.data['message'].toString(),
            ))
          : Left(ServerFailure(message: errorMessage));
    }
  }

  ResultFuture<String> forgotPassword(ForgotPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.forgotPassword(event);
      return Right(response.data);
    } on DioException catch (e) {
      Log.error('Forgot Password Error', e.message);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ServerFailure(message: errorMessage));
    }
  }

  ResultFuture<String> resetPassword(ResetPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resetPassword(event);
      return Right(response.data);
    } on DioException catch (e) {
      Log.error('Reset Password Error', e.message);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ServerFailure(message: errorMessage));
    }
  }

  ResultFuture<String> logout(LogoutEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.logoutUsers();
      return Right(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ServerFailure(message: errorMessage));
    }
  }
}
