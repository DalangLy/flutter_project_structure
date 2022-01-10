import 'package:get_it/get_it.dart';
import 'package:project_structure/injectors/di_external_resources.dart';
import 'package:project_structure/injectors/di_start_up.dart';

final getIt = GetIt.instance;

//was called in main.dart
Future<void> injector() async {
  DIExternalResources(getIt: getIt,);
  DIStartUp(getIt: getIt,);
}