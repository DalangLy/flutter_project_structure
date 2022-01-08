part of 'start_up_locale_load_bloc.dart';

abstract class StartUpLocaleLoadState extends Equatable {
  const StartUpLocaleLoadState();
}

class StartUpLocaleLoadInitial extends StartUpLocaleLoadState {
  @override
  List<Object> get props => [];
}

class LoadLocaleFromLocalStorageInProgress extends StartUpLocaleLoadState {
  const LoadLocaleFromLocalStorageInProgress();

  @override
  List<Object> get props => [];
}

class LoadLocaleFromLocalStorageSuccess extends StartUpLocaleLoadState {
  final Locale locale;
  const LoadLocaleFromLocalStorageSuccess({required this.locale,});

  @override
  List<Object> get props => [];
}