part of 'start_up_theme_load_bloc.dart';

abstract class StartUpThemeLoadEvent extends Equatable {
  const StartUpThemeLoadEvent();
}

class LoadThemeFromLocalStorage extends StartUpThemeLoadEvent {
  const LoadThemeFromLocalStorage();

  @override
  List<Object> get props => [];
}