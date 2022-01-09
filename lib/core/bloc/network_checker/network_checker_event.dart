part of 'network_checker_bloc.dart';

abstract class NetworkCheckerEvent extends Equatable {
  const NetworkCheckerEvent();
}

class CheckNetworkStatus extends NetworkCheckerEvent {
  const CheckNetworkStatus();

  @override
  List<Object> get props => [];
}