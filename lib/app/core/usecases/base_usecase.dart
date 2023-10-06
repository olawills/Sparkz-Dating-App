import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../network/dio_exception.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<NetworkExceptions, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
