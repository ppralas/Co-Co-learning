import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final String subject;

  const Subject(this.subject);

  @override
  List<Object?> get props => [subject];
}
