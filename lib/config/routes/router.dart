import 'package:auto_route/auto_route.dart';
import 'package:project_structure/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:project_structure/features/home/presentation/pages/home_wrapper_page.dart';
import 'package:project_structure/features/login/presentation/pages/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/',
      page: HomeWrapperPage,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          path: '',
          page: DashboardPage,
          initial: true,
        ),
      ],
    ),
  ],
)
class $AppRouter {}