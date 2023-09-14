import 'package:dating_app/app/core/logger/app_logger.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.info('==================START====================');
    Log.info(
        'Request => ${options.baseUrl} ${options.path}${options.queryParameters}');
    Log.info('Headers => ${options.headers}');
    Log.info('Request: ${options.method} ${options.uri}');
    Log.info('Data: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.debug(
        'Response => StatusCode: ${response.statusCode}${response.statusMessage}');
    Log.verbose('Response => Body ${response.data}');
    Log.verbose('Headers => ${response.headers}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final options = error.requestOptions;
    Log.error(options.method); //Debug log
    Log.error('${error.message}', 'Error: ${error.error}');
    return super.onError(error, handler);
  }
}
