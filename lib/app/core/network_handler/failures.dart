import 'package:dating_app/app/core/network_handler/dio_exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class ApiFailure extends Failure {
  ApiFailure({required super.message});

  ApiFailure.fromException(DioExceptions exception)
      : this(message: exception.message);
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
