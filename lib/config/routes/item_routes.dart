import 'package:auto_route/annotations.dart';
import 'package:project_structure/features/item/presentation/pages/item_wrapper_page.dart';

//was injected in "main_router.dart"
const AutoRoute itemRoutes = AutoRoute(
  path: 'items',
  page: ItemWrapperPage,
);