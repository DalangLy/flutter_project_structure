import 'package:auto_route/auto_route.dart';
import 'package:project_structure/config/routes/item_routes.dart';
import 'dashboard_routes.dart';

//was injected in "default_route/router.dart"
const List<AutoRoute> mainRouter = <AutoRoute>[
  dashboardRoutes,
  itemRoutes,
];