import 'package:auto_route/annotations.dart';
import 'package:project_structure/features/item/presentation/pages/item_list_page.dart';
import 'package:project_structure/features/item/presentation/pages/item_wrapper_page.dart';

//was injected in "main_router.dart"
const AutoRoute itemRoutes = AutoRoute(
  path: 'items',
  page: ItemWrapperPage,
  children: <AutoRoute>[
    AutoRoute(
      path: 'items',
      page: ItemListPage,
      initial: true,
    ),
  ]
);