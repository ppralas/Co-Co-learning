import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String title;
  final dynamic error;
  final StackTrace? stackTrace;

  const Failure._({
    required this.title,
    this.error,
    this.stackTrace,
  });

  /// Generic Failure constructor with default title if not provided
  factory Failure.generic({
    String? title,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      Failure._(
        //TODO: pretvoriti string u arb
        title: title ?? 'Unknown error occurred',
        error: error,
        stackTrace: stackTrace,
      );

  @override
  List<Object?> get props => [
        title,
        error,
        stackTrace,
      ];
}
