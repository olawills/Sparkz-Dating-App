import 'package:dating_app/app/core/network_handler/dio_exception.dart';
import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements DioExceptions {
  final String message;
  final int statusCode;

  const ServerException({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];

  @override
  set message(String _message) {
    message = _message;
  }
}

class ApiException extends ServerException {
  ApiException({required super.message, required super.statusCode});
}
