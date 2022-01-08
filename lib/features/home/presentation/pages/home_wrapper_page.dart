import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/language_switcher/language_switcher_bloc.dart';
import 'package:project_structure/core/bloc/logout/logout_bloc.dart';
import 'package:project_structure/core/bloc/theme_switcher/theme_switcher_bloc.dart';
import 'package:project_structure/core/enum/app_locale.dart';
import 'package:project_structure/l10n/gen_l10n/app_localizations.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home Wrapper Page'),
              Text(AppLocalizations.of(context)!.helloWorld),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeSwitcherBloc>(context).add(
                    const ChangeTheme(
                      themeMode: ThemeMode.dark,
                    ),
                  );
                },
                child: const Text('Change To Dark Mode'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeSwitcherBloc>(context).add(
                    const ChangeTheme(
                      themeMode: ThemeMode.light,
                    ),
                  );
                },
                child: const Text('Change To Light Mode'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeSwitcherBloc>(context).add(
                    const ChangeTheme(
                      themeMode: ThemeMode.system,
                    ),
                  );
                },
                child: const Text('Change To System Theme Mode'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeSwitcherBloc>(context).add(
                    const ChangeTheme(
                      themeMode: ThemeMode.system,
                    ),
                  );
                },
                child: const Text('Change To System Theme Mode'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LanguageSwitcherBloc>(context).add(
                    const ChangeLanguage(
                      appLocale: AppLocale.english,),
                  );
                },
                child: const Text('Change To EN'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LanguageSwitcherBloc>(context).add(
                    const ChangeLanguage(
                      appLocale: AppLocale.spain,),
                  );
                },
                child: const Text('Change To ES'),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LogoutBloc, LogoutState>(
                builder: (context, state) {
                  if (state is LogoutInProgress) {
                    return const ElevatedButton(
                      onPressed: null,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LogoutBloc>(context).add(
                        const Logout(),
                      );
                    },
                    child: const Text('Logout'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
