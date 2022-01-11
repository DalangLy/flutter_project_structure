import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DIExternalResources{
  final GetIt getIt;
  DIExternalResources({required this.getIt,}){
    /****************************************
    *********** SharedPreferences ***********
    *****************************************/
    getIt.registerLazySingleton(() => SharedPreferences.getInstance(),);
    /****************************************
     *********** Dio ***********
     *****************************************/
    getIt.registerLazySingleton(() => Dio(),);
  }
}