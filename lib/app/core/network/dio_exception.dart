// ignore_for_file: constant_pattern_never_matches_value_type
import 'dart:io' show SocketException;

import 'package:dating_app/app/common/common.dart';
import 'package:dio/dio.dart' show DioException, DioExceptionType;

class DioExceptions implements Exception {
  static final DioExceptions dioExceptions = DioExceptions._();

  factory DioExceptions() => dioExceptions;
  DioExceptions._();

  late String message;

  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.message) {
      case DioExceptionType.cancel:
        message = AppString.cancelRequest;
        break;
      case DioExceptionType.connectionTimeout:
        message = AppString.connectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = AppString.receiveTimeout;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response!.statusCode,
          dioException.response!.data['message'],
        );
        break;
      case DioExceptionType.sendTimeout:
        message = AppString.sendTimeOut;
        break;
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          message = AppString.socketException;
          break;
        }
        message = AppString.unexpectedError;
        break;

      default:
        message = AppString.unknownError;
        break;
    }
  }

  String _handleError(int? statusCode, String error) {
    switch (statusCode) {
      case 400:
        // return AppString.badRequest;
        return error;
      case 401:
        // return AppString.unauthorized;
        return error;
      case 403:
        return AppString.forbidden;
      case 404:
        // return AppString.notFound;
        return error;
      case 409:
        return AppString.duplicateEmail;
      case 500:
        return AppString.internalServerError;
      default:
        // return AppString.unknownError;
        return error;
    }
  }

  @override
  String toString() => message;
}

class DioErrorHandler {
  static final DioErrorHandler _dioErrorHandler = DioErrorHandler._internal();
  factory DioErrorHandler() => _dioErrorHandler;
  DioErrorHandler._internal();
  
  static dynamic handleDioError(DioException exception) {
    switch (exception.message) {
      case DioExceptionType.cancel:
        return AppString.cancelRequest;
      case DioExceptionType.connectionTimeout:
        return AppString.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return AppString.sendTimeOut;
      case DioExceptionType.receiveTimeout:
        return AppString.receiveTimeout;
      case DioExceptionType.unknown:
        if (exception is SocketException) {
          return AppString.socketException;
        }
        return AppString.unexpectedError;
      default:
        return AppString.unknownError;
    }
  }
}
