import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/network_checker/network_checker_bloc.dart';
import 'package:project_structure/features/home/presentation/widgets/animated_menu_icon.dart';
import 'package:project_structure/features/home/presentation/widgets/main_end_drawer.dart';
import 'package:project_structure/features/home/presentation/widgets/main_scaffold.dart';
import 'package:project_structure/features/home/presentation/widgets/main_navigation.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

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
      child: MainScaffold(
        appBar: AppBar(
          leading: _toggleDrawerButton(),
          backgroundColor: Colors.grey,
        ),
        drawer: const MainNavigation(
          navigationItems: [],
        ),
        endDrawer: const MainEndDrawer(),
        body: const SafeArea(
          child: AutoRouter(),
        ),
      ),
    );
  }

  Widget _toggleDrawerButton(){
    return Builder(
        builder: (context) {
          return AnimatedMenuIcon(
            onPressed: () => MainScaffold.of(context).toggleDrawer(),
          );
        }
    );
  }
}