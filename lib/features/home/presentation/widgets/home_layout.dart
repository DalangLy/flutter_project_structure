import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final Widget drawer;
  final Widget body;
  final Widget endDrawer;
  const HomeLayout({Key? key, required this.body, required this.drawer, required this.endDrawer,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: endDrawer,
      ),
      body: SafeArea(
        child: Row(
          children: [
            Drawer(
              child: drawer,
            ),
            Expanded(
              child: Column(
                children: [
                  AppBar(),
                  Expanded(child: body,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
