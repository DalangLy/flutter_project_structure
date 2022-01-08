import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_structure/core/enum/app_locale.dart';

part 'start_up_locale_load_event.dart';
part 'start_up_locale_load_state.dart';

class StartUpLocaleLoadBloc extends Bloc<StartUpLocaleLoadEvent, StartUpLocaleLoadState> {
  StartUpLocaleLoadBloc() : super(StartUpLocaleLoadInitial()) {
    on<StartUpLocaleLoadEvent>((event, emit) async{
      if(event is LoadLocaleFromLocalStorage){
        emit(const LoadLocaleFromLocalStorageInProgress(),);
        await Future.delayed(const Duration(seconds: 8,),);
        emit(LoadLocaleFromLocalStorageSuccess(locale:  appLocaleData[AppLocale.spain]!,),);
      }
    });
  }
}
