import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_structure/config/app_locale/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_switcher_event.dart';
part 'language_switcher_state.dart';

class LanguageSwitcherBloc extends Bloc<LanguageSwitcherEvent, LanguageSwitcherState> {
  final Future<SharedPreferences> _prefs;
  LanguageSwitcherBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(LanguageSwitcherInitial()) {
    on<LanguageSwitcherEvent>((event, emit) async{
      if(event is ChangeLanguage){
        emit(const ChangeLocaleInProgress());
        final SharedPreferences prefs = await _prefs;
        final AppLocale appLocale = await prefs.setString('language', event.appLocale.name.toString()).then((value) => event.appLocale);
        emit(ChangeLocaleSuccess(locale: appLocaleData[appLocale]!),);
      }
    });
  }
}
