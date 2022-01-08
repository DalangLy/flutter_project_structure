import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_structure/core/enum/app_locale.dart';

part 'language_switcher_event.dart';
part 'language_switcher_state.dart';

class LanguageSwitcherBloc extends Bloc<LanguageSwitcherEvent, LanguageSwitcherState> {
  LanguageSwitcherBloc() : super(LanguageSwitcherInitial()) {
    on<LanguageSwitcherEvent>((event, emit) async{
      if(event is ChangeLanguage){
        emit(const ChangeLocaleInProgress());
        await Future.delayed(const Duration(seconds: 2),);
        emit(ChangeLocaleSuccess(locale: appLocaleData[event.appLocale]!),);
      }
    });
  }
}
