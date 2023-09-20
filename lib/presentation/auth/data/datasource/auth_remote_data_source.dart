import 'dart:convert';

import 'package:dating_app/injection_container.dart';
import 'package:dating_app/presentation/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../app/core/network_handler/dio_client.dart';

abstract class AuthRemoteDataSource {
  Future<Response> createUser(SignupEvent event);
  Future<Response> loginUser(LoginEvent event);
  Future<Response> verifyOtp(VerifyOtpEvent event);
  Future<Response> resendOtp(ResendOtpEvent event);
  Future<Response> forgotPassword(ForgotPasswordEvent event);
  Future<Response> resetPassword(ResetPasswordEvent event);
  Future<Response> logoutUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient = serviceLocator<DioClient>();

  @override
  Future<Response> createUser(SignupEvent event) async {
    final register = {
      'firstName': event.firstName,
      'lastName': event.lastName,
      'email': event.email,
      'password': event.password,
    };
    final data = jsonEncode(register);
    return await dioClient.dio.post(
      '/auth/register',
      data: data,
    );
  }

  @override
  Future<Response> loginUser(LoginEvent event) async {
    final login = {
      'email': event.email,
      'password': event.password,
    };
    final data = jsonEncode(login);
    return await dioClient.dio.post(
      '/auth/login',
      data: data,
    );
  }

  @override
  Future<Response> verifyOtp(VerifyOtpEvent event) async {
    final verifyOtp = {
      'otp': event.otp,
      'email': event.email,
    };
    final data = jsonEncode(verifyOtp);
    return await dioClient.dio.post(
      '/auth/verifyOtp',
      data: data,
    );
  }

  @override
  Future<Response> resendOtp(ResendOtpEvent event) async {
    final resentOtp = {
      'email': event.email,
    };
    final data = jsonEncode(resentOtp);
    return await dioClient.dio.post(
      '/auth/resendOtp',
      data: data,
    );
  }

  @override
  Future<Response> forgotPassword(ForgotPasswordEvent event) async {
    final forgotData = {
      'email': event.email,
    };
    final data = jsonEncode(forgotData);
    return await dioClient.dio.post(
      '/auth/forgotPassword',
      data: data,
    );
  }

  @override
  Future<Response> resetPassword(ResetPasswordEvent event) async {
    final resetData = {
      'otp': event.otp,
      'password': event.password,
      'email': event.email,
    };
    final data = jsonEncode(resetData);
    return await dioClient.dio.post(
      '/auth/resetPassword',
      data: data,
    );
  }

  @override
  Future<Response> logoutUsers() async {
    return await dioClient.dio.post('/auth/logout');
  }
}
