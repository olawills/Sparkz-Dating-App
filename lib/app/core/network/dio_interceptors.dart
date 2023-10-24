import 'dart:io';

import 'package:dating_app/app/core/network/request_retrier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;
  RetryOnConnectionChangeInterceptor({required this.requestRetrier});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        'Request => ${options.baseUrl} ${options.path}${options.queryParameters}');
    debugPrint('Data: ${options.data}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response => ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      try {
        requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        e;
      }
    }
    err;
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.unknown &&
        err.error != null &&
        err.error is SocketException;
  }
}
