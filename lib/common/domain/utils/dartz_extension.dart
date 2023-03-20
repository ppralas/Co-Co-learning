import 'package:dartz/dartz.dart';
import 'package:skola/common/domain/entities/failure.dart';

extension DartzExtension<R> on Either<Failure, R> {
  Failure asLeft() => (this as Left).value;
  R asRight() => (this as Right).value;
}
