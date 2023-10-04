import 'dart:convert';

import 'package:dating_app/src/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../app/core/network/dio_interceptors.dart';
import '../../../../app/core/services/api_url.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({Dio? dio})
      : _dio = dio ?? Dio()
          ..interceptors.add(DioInterceptor())
          ..options.baseUrl = ApiConfig.baseUrl
          ..options.connectTimeout = ApiConfig.connectionTimeout
          ..options.receiveTimeout = ApiConfig.receiveTimeout
          ..options.sendTimeout = const Duration(milliseconds: 20000)
          ..options.baseUrl = ApiConfig.baseUrl
          ..options.headers = ApiConfig.header
          ..options.contentType = 'application/json; charset=utf-8'
          ..options.responseType = ResponseType.json;
  final Dio _dio;

  Future<Response> createUser(SignupEvent event) async {
    final register = {
      'firstName': event.firstName,
      'lastName': event.lastName,
      'email': event.email,
      'password': event.password,
    };
    final data = jsonEncode(register);
    return await _dio.post(
      '/auth/register',
      data: data,
    );
  }

  Future<Response> loginUser(LoginEvent event) async {
    final login = {
      'email': event.email,
      'password': event.password,
    };
    final data = jsonEncode(login);
    return await _dio.post(
      '/auth/login',
      data: data,
    );
  }

  Future<Response> verifyOtp(VerifyOtpEvent event) async {
    final verifyOtp = {
      'otp': event.otp,
      'email': event.email,
    };
    final data = jsonEncode(verifyOtp);
    return await _dio.post(
      '/auth/verifyOtp',
      data: data,
    );
  }

  Future<Response> resendOtp(ResendOtpEvent event) async {
    final resentOtp = {
      'email': event.email,
    };
    final data = jsonEncode(resentOtp);
    return await _dio.post(
      '/auth/resendOtp',
      data: data,
    );
  }

  Future<Response> forgotPassword(ForgotPasswordEvent event) async {
    final forgotData = {
      'email': event.email,
    };
    final data = jsonEncode(forgotData);
    return await _dio.post(
      '/auth/forgotPassword',
      data: data,
    );
  }

  Future<Response> resetPassword(ResetPasswordEvent event) async {
    final resetData = {
      'otp': event.otp,
      'password': event.password,
      'email': event.email,
    };
    final data = jsonEncode(resetData);
    return await _dio.post(
      '/auth/resetPassword',
      data: data,
    );
  }

  Future<Response> logoutUsers() async {
    return await _dio.post('/auth/logout');
  }
}
