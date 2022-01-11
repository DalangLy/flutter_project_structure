import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ItemWrapperPage extends StatelessWidget {
  const ItemWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AutoRouter(),
      ),
    );
  }
}
