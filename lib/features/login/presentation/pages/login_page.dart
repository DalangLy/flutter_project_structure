import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/network_checker/network_checker_bloc.dart';
import 'package:project_structure/core/bloc/theme_switcher/theme_switcher_bloc.dart';
import 'package:project_structure/features/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCheckerBloc, NetworkCheckerState>(
      listener: (context, state) {
        if(state is IsOnline){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Online using ${state.type}'),),);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offline'),),);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginInProgress) {
                        return const ElevatedButton(
                          onPressed: null,
                          child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              const Login(),);
                          },
                          child: const Text('Login Page'));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
        ),
      ),
    );
  }
}
