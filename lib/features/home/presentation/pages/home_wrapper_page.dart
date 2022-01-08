import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/features/home/presentation/widgets/end_drawer.dart';
import 'package:project_structure/features/home/presentation/widgets/home_layout.dart';
import 'package:project_structure/features/home/presentation/widgets/main_drawer.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      drawer: MainDrawer(),
      endDrawer: const EndDrawer(),
      body: const AutoRouter(),
    );
  }
}