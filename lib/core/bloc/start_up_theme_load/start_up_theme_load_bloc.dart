import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'start_up_theme_load_event.dart';
part 'start_up_theme_load_state.dart';

class StartUpThemeLoadBloc extends Bloc<StartUpThemeLoadEvent, StartUpThemeLoadState> {
  StartUpThemeLoadBloc() : super(StartUpThemeLoadInitial()) {
    on<StartUpThemeLoadEvent>((event, emit) async{
      if(event is LoadThemeFromLocalStorage){
        emit(const LoadThemeFromLocalStorageInProgress(),);
        await Future.delayed(const Duration(seconds: 5,),);
        emit(const LoadThemeFromLocalStorageSuccess(themeMode: ThemeMode.dark,),);
      }
    });
  }
}
