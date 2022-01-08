part of 'start_up_locale_load_bloc.dart';

abstract class StartUpLocaleLoadEvent extends Equatable {
  const StartUpLocaleLoadEvent();
}

class LoadLocaleFromLocalStorage extends StartUpLocaleLoadEvent {
  const LoadLocaleFromLocalStorage();

  @override
  List<Object> get props => [];
}