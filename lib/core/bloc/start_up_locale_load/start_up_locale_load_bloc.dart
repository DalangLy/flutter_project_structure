import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_structure/core/enum/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'start_up_locale_load_event.dart';
part 'start_up_locale_load_state.dart';

class StartUpLocaleLoadBloc extends Bloc<StartUpLocaleLoadEvent, StartUpLocaleLoadState> {
  final Future<SharedPreferences> _prefs;
  StartUpLocaleLoadBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(StartUpLocaleLoadInitial()) {
    on<StartUpLocaleLoadEvent>((event, emit) async{
      if(event is LoadLocaleFromLocalStorage){
        emit(const LoadLocaleFromLocalStorageInProgress(),);
        final SharedPreferences prefs = await _prefs;
        final String appLocaleInStringFormat = prefs.getString('language') ?? 'system';
        final Locale? locale = getLocaleFromString(appLocaleInStringFormat: appLocaleInStringFormat);
        emit(LoadLocaleFromLocalStorageSuccess(locale: locale,),);
      }
    });
  }

  Locale? getLocaleFromString({required String appLocaleInStringFormat,}) {
    final AppLocale? appLocale = EnumToString.fromString(
      AppLocale.values,
      appLocaleInStringFormat,
    );
    return appLocaleData[appLocale];
  }
}
