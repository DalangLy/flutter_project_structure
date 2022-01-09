import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'network_checker_event.dart';
part 'network_checker_state.dart';

class NetworkCheckerBloc extends Bloc<NetworkCheckerEvent, NetworkCheckerState> {
  NetworkCheckerBloc() : super(NetworkCheckerInitial()) {
    on<NetworkCheckerEvent>((event, emit) {
      if(event is CheckNetworkStatus){
        emit(const IsOnline());
      }
    });
  }
}
