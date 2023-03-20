import 'package:dartz/dartz.dart';
import 'package:skola/common/domain/entities/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
