import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/core/bloc/network_checker/network_checker_bloc.dart';
import 'package:project_structure/features/home/presentation/widgets/end_drawer.dart';
import 'package:project_structure/features/home/presentation/widgets/home_layout.dart';
import 'package:project_structure/features/home/presentation/widgets/main_drawer.dart';

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
      child: const HomeLayout(
        drawer: MainDrawer(),
        endDrawer: EndDrawer(),
        body: AutoRouter(),
      ),
    );
  }
}