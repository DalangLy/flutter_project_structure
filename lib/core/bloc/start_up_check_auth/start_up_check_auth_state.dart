part of 'start_up_check_auth_bloc.dart';

abstract class StartUpCheckAuthState extends Equatable {
  const StartUpCheckAuthState();
}

class StartUpCheckAuthInitial extends StartUpCheckAuthState {
  @override
  List<Object> get props => [];
}

class CheckAuthInProgress extends StartUpCheckAuthState {
  const CheckAuthInProgress();

  @override
  List<Object> get props => [];
}

class CheckAuthSuccess extends StartUpCheckAuthState {
  final bool isAuth;
  const CheckAuthSuccess({required this.isAuth,});

  @override
  List<Object> get props => [];
}