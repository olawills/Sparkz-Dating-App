import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../common/constants/app_string.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(AppString.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return const ServerFailure(AppString.sendTimeOut);
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(AppString.receiveTimeout);
      case DioExceptionType.badResponse:
        return ServerFailure(error.response!.data['message']);
      case DioExceptionType.unknown:
        if (error.message!.contains('SocketException')) {
          return const ServerFailure(AppString.socketException);
        }
        return const ServerFailure(AppString.unexpectedError);
      default:
        return const ServerFailure(AppString.unknownError);
    }
  }
}
