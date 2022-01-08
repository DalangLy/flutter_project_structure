import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/logout/logout_bloc.dart';
import 'package:project_structure/core/bloc/theme_switcher/theme_switcher_bloc.dart';

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
