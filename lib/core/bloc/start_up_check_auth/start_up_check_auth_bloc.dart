import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'start_up_check_auth_event.dart';
part 'start_up_check_auth_state.dart';

class StartUpCheckAuthBloc extends Bloc<StartUpCheckAuthEvent, StartUpCheckAuthState> {
  StartUpCheckAuthBloc() : super(StartUpCheckAuthInitial()) {
    on<StartUpCheckAuthEvent>((event, emit) async{
      if(event is CheckAuth){
        emit(const CheckAuthInProgress());
        await Future.delayed(const Duration(seconds: 3,),);
        emit(const CheckAuthSuccess(isAuth: true),);
      }
    });
  }
}
