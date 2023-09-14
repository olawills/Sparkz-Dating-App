import 'package:dartz/dartz.dart';
import 'package:dating_app/app/core/network_handler/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid<T> = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
