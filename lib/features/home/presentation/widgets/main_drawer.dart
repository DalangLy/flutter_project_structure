import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String _path = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AutoRouter.of(context).addListener(() {
      setState(() {
        _path = AutoRouter.of(context).currentSegments[1].path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Material(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.speed,),
              onTap: () => AutoRouter.of(context).pushNamed(''),
              title: const Text('Dashboard'),
              selected: _path == '',
            ),
            ListTile(
              leading: const Icon(Icons.category,),
              onTap: () => AutoRouter.of(context).pushNamed('items'),
              title: const Text('Items'),
              selected: _path == 'items',
            ),
          ],
        ),
      ),
    );
  }
}
