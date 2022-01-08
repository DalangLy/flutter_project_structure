import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
