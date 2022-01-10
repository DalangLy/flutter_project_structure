import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/language_switcher/language_switcher_bloc.dart';
import 'package:project_structure/core/bloc/logout/logout_bloc.dart';
import 'package:project_structure/core/bloc/theme_switcher/theme_switcher_bloc.dart';
import 'package:project_structure/config/app_locale/app_locale.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.monitor),
          title: const Text('System Theme Mode'),
          onTap: () {
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              const ChangeTheme(
                themeMode: ThemeMode.system,
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.dark_mode),
          title: const Text('Dark Theme Mode'),
          onTap: () {
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              const ChangeTheme(
                themeMode: ThemeMode.dark,
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.light_mode),
          title: const Text('Light Theme Mode'),
          onTap: () {
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              const ChangeTheme(
                themeMode: ThemeMode.light,
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('System Language'),
          onTap: () {
            BlocProvider.of<LanguageSwitcherBloc>(context).add(
              const ChangeLanguage(
                appLocale: AppLocale.system,),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('English'),
          onTap: () {
            BlocProvider.of<LanguageSwitcherBloc>(context).add(
                                const ChangeLanguage(
                                  appLocale: AppLocale.english,),
                              );
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Spain'),
          onTap: () {
            BlocProvider.of<LanguageSwitcherBloc>(context).add(
              const ChangeLanguage(
                appLocale: AppLocale.spain,),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            BlocProvider.of<LogoutBloc>(context).add(
                                    const Logout(),
                                  );
          },
          trailing: BlocBuilder<LogoutBloc, LogoutState>(
            builder: (context, state) {
              if (state is LogoutInProgress) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
