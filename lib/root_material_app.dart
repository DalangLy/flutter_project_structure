import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/logout/logout_bloc.dart';
import 'package:project_structure/core/bloc/start_up_check_auth/start_up_check_auth_bloc.dart';
import 'package:project_structure/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_structure/l10n/gen_l10n/app_localizations.dart';
import 'config/routes/router.gr.dart';
import 'core/bloc/language_switcher/language_switcher_bloc.dart';
import 'core/bloc/start_up_locale_load/start_up_locale_load_bloc.dart';
import 'core/bloc/start_up_theme_load/start_up_theme_load_bloc.dart';
import 'core/bloc/theme_switcher/theme_switcher_bloc.dart';
import 'features/start_up_loading/presentation/pages/start_up_loading_page.dart';

class RootMaterialApp extends StatefulWidget {
  const RootMaterialApp({Key? key}) : super(key: key);

  @override
  _RootMaterialAppState createState() => _RootMaterialAppState();
}

class _RootMaterialAppState extends State<RootMaterialApp> {
  final AppRouter _appRouter = AppRouter();

  late bool _isLoaded = false;

  late ThemeMode _themeMode = ThemeMode.system;
  void _changeTheme({required ThemeMode themeMode,}){
    setState(() {
      _themeMode = themeMode;
    });
  }

  late Locale? _locale;
  void _changeLanguage({required Locale locale,}){
    setState(() {
      _locale = locale;
    });
  }

  late bool _isAuth = false;

  @override
  void initState() {
    super.initState();

    _locale = null;
  }

  @override
  Widget build(BuildContext context) {
    return StartUpMultiBlocProvider(
      child: MultiBlocListener(
        listeners: [
          BlocListener<StartUpThemeLoadBloc, StartUpThemeLoadState>(
            listener: (context, state) {
              if(state is LoadThemeFromLocalStorageSuccess){
                _changeTheme(themeMode: state.themeMode,);
              }
            },
          ),
          BlocListener<StartUpLocaleLoadBloc, StartUpLocaleLoadState>(
            listener: (context, state) {
              if(state is LoadLocaleFromLocalStorageSuccess){
                _changeLanguage(locale: state.locale,);
              }
            },
          ),
          BlocListener<ThemeSwitcherBloc, ThemeSwitcherState>(
            listener: (context, state) {
              if(state is ChangeThemeSuccess){
                _changeTheme(themeMode: state.themeMode,);
              }
            },
          ),
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if(state is LogoutSuccess){
                setState(() {
                  _isAuth = false;
                });
              }
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state is LoginSuccess){
                setState(() {
                  _isAuth = true;
                });
              }
            },
          ),
          BlocListener<LanguageSwitcherBloc, LanguageSwitcherState>(
            listener: (context, state) {
              if(state is ChangeLocaleSuccess){
                _changeLanguage(locale: state.locale);
              }
            },
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.title,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: _themeMode,
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) => [
              // if the user is logged in, they may proceed to the main App
              if (_isAuth)
                const HomeWrapperRoute()
              // if they are not logged in, bring them to the Login page
              else
                const LoginRoute(),
            ],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (BuildContext context, Widget? child) => _isLoaded ? child! : StartUpLoadingPage(loadingCallback: (isLoaded) {
            setState(() {
              _isLoaded = isLoaded;
            });
          },),
        ),
      )
    );
  }
}


class StartUpMultiBlocProvider extends MultiBlocProvider{
  StartUpMultiBlocProvider({Key? key, required Widget child,}) : super(key: key, 
    child: child,
    providers: [
      BlocProvider<StartUpCheckAuthBloc>(create: (context) => StartUpCheckAuthBloc(),),
      BlocProvider<StartUpThemeLoadBloc>(create: (context) => StartUpThemeLoadBloc(),),
      BlocProvider<ThemeSwitcherBloc>(create: (context) => ThemeSwitcherBloc(),),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc(),),
      BlocProvider<LogoutBloc>(create: (context) => LogoutBloc(),),
      BlocProvider<LanguageSwitcherBloc>(create: (context) => LanguageSwitcherBloc(),),
      BlocProvider<StartUpLocaleLoadBloc>(create: (context) => StartUpLocaleLoadBloc(),),
    ]
  );
}