import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  final Future<SharedPreferences> _prefs;
  ThemeSwitcherBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(ThemeSwitcherInitial()) {
    on<ThemeSwitcherEvent>((event, emit) async{
      if(event is ChangeTheme){
        emit(const ChangeThemeInProgress(),);
        final SharedPreferences prefs = await _prefs;
        final ThemeMode themeMode = await prefs.setString('theme', event.themeMode.name.toString()).then((value) => event.themeMode);
        emit(ChangeThemeSuccess(themeMode: themeMode,),);
      }
    });
  }
}
