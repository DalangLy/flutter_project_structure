import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if(event is Login){
        emit(const LoginInProgress(),);
        await Future.delayed(const Duration(seconds: 2,),);
        emit(const LoginSuccess(),);
      }
    });
  }
}
