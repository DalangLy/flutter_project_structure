import 'package:auto_route/annotations.dart';
import 'package:project_structure/features/dashboard/presentation/pages/dashboard_page.dart';

//was injected in "main_router.dart"
const AutoRoute dashboardRoutes = AutoRoute(
  path: '',
  page: DashboardPage,
  initial: true,
);