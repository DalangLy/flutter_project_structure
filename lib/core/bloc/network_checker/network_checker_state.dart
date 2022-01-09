part of 'network_checker_bloc.dart';

abstract class NetworkCheckerState extends Equatable {
  const NetworkCheckerState();
}

class NetworkCheckerInitial extends NetworkCheckerState {
  @override
  List<Object> get props => [];
}

class IsOnline extends NetworkCheckerState {
  const IsOnline();

  @override
  List<Object> get props => [];
}