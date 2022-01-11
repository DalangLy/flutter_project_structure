import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class UnAuthenticated extends Failure{
  @override
  List<Object?> get props => [];
}

class UnknownError extends Failure{
  final String message;

  UnknownError({this.message = 'Something went wrong!'});

  @override
  List<Object?> get props => [];
}