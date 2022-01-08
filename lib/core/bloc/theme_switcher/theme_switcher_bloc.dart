import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  ThemeSwitcherBloc() : super(ThemeSwitcherInitial()) {
    on<ThemeSwitcherEvent>((event, emit) async{
      if(event is ChangeTheme){
        emit(const ChangeThemeInProgress(),);
        await Future.delayed(const Duration(seconds: 1,),);
        emit(ChangeThemeSuccess(themeMode: event.themeMode,),);
      }
    });
  }
}
