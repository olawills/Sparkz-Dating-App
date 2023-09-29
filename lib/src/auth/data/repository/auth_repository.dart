import 'package:dartz/dartz.dart';
import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dating_app/src/auth/data/datasource/auth_remote_data_source.dart';
import 'package:dating_app/src/auth/data/models/login_response.dart';
import 'package:dating_app/src/auth/data/models/user.dart';
import 'package:dating_app/src/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../../app/core/network/failures.dart';

class AuthRepositories {
  AuthRepositories({AuthRemoteDataSourceImpl? authRemoteDataSourceImpl})
      : _authRemoteDataSourceImpl =
            authRemoteDataSourceImpl ?? AuthRemoteDataSourceImpl();
  final AuthRemoteDataSourceImpl _authRemoteDataSourceImpl;

  ResultFuture<LoginResponse> login(LoginEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.loginUser(event);
      return Right(LoginResponse.fromJson(response.data));
    } on ServerFailure catch (e) {
      Log.error('login error', e.message);
      return Left(e);
    }
  }

  ResultFuture<User> signup(SignupEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.createUser(event);
      Log.debug(response.data['user']);
      return Right(User.fromJson(response.data['user']));
    } on ServerFailure catch (e) {
      Log.error('Signup error', e.message);
      return Left(e);
    }
  }

  ResultFuture<String> verifyOtp(VerifyOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.verifyOtp(event);
      debugPrint(response.data);
      return Right(response.data['message']);
    } on ServerFailure catch (e) {
      Log.error('Verify Otp error', e.message);
      return Left(e);
    }
  }

  ResultFuture<String> resendOtp(ResendOtpEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resendOtp(event);
      return Right(response.data['message']);
    } on ServerFailure catch (e) {
      Log.error('Resend Otp error', e.message);
      return Left(e);
    }
  }

  ResultFuture<String> forgotPassword(ForgotPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.forgotPassword(event);
      return Right(response.data);
    } on ServerFailure catch (e) {
      Log.error('Forgot Password Error', e.message);
      return Left(e);
    }
  }

  ResultFuture<String> resetPassword(ResetPasswordEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.resetPassword(event);
      return Right(response.data);
    } on ServerFailure catch (e) {
      Log.error('Reset Password Error', e.message);
      return Left(e);
    }
  }

  ResultFuture<String> logout(LogoutEvent event) async {
    try {
      final response = await _authRemoteDataSourceImpl.logoutUsers();
      return Right(response.data);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
