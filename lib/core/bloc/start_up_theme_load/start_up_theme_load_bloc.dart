import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'start_up_theme_load_event.dart';
part 'start_up_theme_load_state.dart';

class StartUpThemeLoadBloc extends Bloc<StartUpThemeLoadEvent, StartUpThemeLoadState> {
  final Future<SharedPreferences> _prefs;
  StartUpThemeLoadBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(StartUpThemeLoadInitial()) {
    on<StartUpThemeLoadEvent>((event, emit) async{
      if(event is LoadThemeFromLocalStorage){
        emit(const LoadThemeFromLocalStorageInProgress(),);
        final SharedPreferences prefs = await _prefs;
        final String themModeInStringFormat = prefs.getString('theme') ?? 'system';
        final ThemeMode themeMode = getThemeModeEnumFromString(themeModeInStringFormat: themModeInStringFormat);
        emit(LoadThemeFromLocalStorageSuccess(themeMode: themeMode,),);
      }
    });
  }

  ThemeMode getThemeModeEnumFromString({required String themeModeInStringFormat,}) {
    final ThemeMode? themeMode = EnumToString.fromString(
      ThemeMode.values,
      themeModeInStringFormat,
    );
    return themeMode!;
  }
}
