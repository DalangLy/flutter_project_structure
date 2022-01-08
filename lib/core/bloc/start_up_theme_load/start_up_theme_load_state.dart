part of 'start_up_theme_load_bloc.dart';

abstract class StartUpThemeLoadState extends Equatable {
  const StartUpThemeLoadState();
}

class StartUpThemeLoadInitial extends StartUpThemeLoadState {
  @override
  List<Object> get props => [];
}

class LoadThemeFromLocalStorageInProgress extends StartUpThemeLoadState {
  const LoadThemeFromLocalStorageInProgress();

  @override
  List<Object> get props => [];
}

class LoadThemeFromLocalStorageSuccess extends StartUpThemeLoadState {
  final ThemeMode themeMode;
  const LoadThemeFromLocalStorageSuccess({required this.themeMode,});

  @override
  List<Object> get props => [];
}