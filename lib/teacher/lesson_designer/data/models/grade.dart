import 'package:equatable/equatable.dart';

class Grade extends Equatable {
  final int grade;

  const Grade(this.grade);

  @override
  List<Object?> get props => [grade];
}
