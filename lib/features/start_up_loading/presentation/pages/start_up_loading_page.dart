import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/start_up_check_auth/start_up_check_auth_bloc.dart';
import 'package:project_structure/core/bloc/start_up_locale_load/start_up_locale_load_bloc.dart';
import 'package:project_structure/core/bloc/start_up_theme_load/start_up_theme_load_bloc.dart';

class StartUpLoadingPage extends StatefulWidget {
  final Function(
    bool isLoaded,
  ) loadingCallback;

  const StartUpLoadingPage({
    Key? key,
    required this.loadingCallback,
  }) : super(key: key);

  @override
  _StartUpLoadingPageState createState() => _StartUpLoadingPageState();
}

class _StartUpLoadingPageState extends State<StartUpLoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _animation.value >= 1) {
        widget.loadingCallback(true);
      }
    });

    //call processes
    BlocProvider.of<StartUpCheckAuthBloc>(context).add(
      const CheckAuth(),
    );
    BlocProvider.of<StartUpLocaleLoadBloc>(context).add(const LoadLocaleFromLocalStorage());
    BlocProvider.of<StartUpThemeLoadBloc>(context).add(const LoadThemeFromLocalStorage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late double _progressValue = 0;

  void _updateProgressValue(double value) {
    setState(() {
      _progressValue += value;
    });

    _controller.animateTo(_progressValue);
  }

  late String _loadingText = '';
  void _updateLoadingText({required String text,}){
    setState(() {
      _loadingText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StartUpCheckAuthBloc, StartUpCheckAuthState>(
          listener: (context, state) {
            if(state is CheckAuthSuccess){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Check Auth...');
            }
          },
        ),
        BlocListener<StartUpLocaleLoadBloc, StartUpLocaleLoadState>(
          listener: (context, state) {
            if(state is LoadLocaleFromLocalStorageSuccess){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Load Locale...');
            }
          },
        ),
        BlocListener<StartUpThemeLoadBloc, StartUpThemeLoadState>(
          listener: (context, state) {
            if(state is LoadThemeFromLocalStorageSuccess){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Check Theme...');
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 300,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((_animation.value * 100).toString()),
                      Text(_loadingText),
                      const SizedBox(
                        height: 20,
                      ),
                      LinearProgressIndicator(
                        value: _animation.value,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
