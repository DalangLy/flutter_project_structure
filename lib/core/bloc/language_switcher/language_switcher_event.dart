part of 'language_switcher_bloc.dart';

abstract class LanguageSwitcherEvent extends Equatable {
  const LanguageSwitcherEvent();
}

class ChangeLanguage extends LanguageSwitcherEvent {
  final AppLocale appLocale;
  const ChangeLanguage({required this.appLocale,});

  @override
  List<Object> get props => [];
}

class LoadLocaleFromLocalStorage extends LanguageSwitcherEvent {
  const LoadLocaleFromLocalStorage();

  @override
  List<Object> get props => [];
}