import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  final List<MainNavigationItem> navigationItems;
  const MainNavigation({Key? key, required this.navigationItems,}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  String _path = '';
  @override
  void initState() {
    super.initState();

    AutoRouter.of(context).addListener(() {
      setState(() {
        _path = AutoRouter.of(context).currentSegments[1].path;
      });
    });
  }

  static const Color _drawerHeaderColor = Color(0xFF303C54);
  static const Color _drawerBackgroundColor = Color(0xFF3C4B64);
  static const Color _selectedColor = Color(0xFF3B4659);
  static const Color _expansionTileBackgroundColor = Color(0xFF303C50);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _drawerBackgroundColor,
      child: ListView(
        children: [
          const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: _drawerHeaderColor,
            // ),
            child: Text('Flutter', style: TextStyle(color: Colors.white),),
            margin: EdgeInsets.all(0),
          ), ...widget.navigationItems.map((navigationItem){
            if(navigationItem.children.isNotEmpty){
              return _expansionNavigationItem(mainNavigationItem: navigationItem,);
            }
            else{
              return _navigationItem(mainNavigationItem: navigationItem,);
            }
          },),
        ],
      ),
    );
  }

  Widget _expansionNavigationItem({required MainNavigationItem mainNavigationItem}){
    return ExpansionTile(
      leading: Icon(mainNavigationItem.iconData, color: Colors.white,),
      title: Text(mainNavigationItem.title, style: const TextStyle(color: Colors.white),),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: _expansionTileBackgroundColor,
      collapsedBackgroundColor: _drawerBackgroundColor,
      children: mainNavigationItem.children.map((child){
        return Material(
          child: ListTile(
            leading: Icon(child.iconData, color: Colors.white,),
            title: Text(child.title, style: const TextStyle(color: Colors.white),),
            onTap: () {
              AutoRouter.of(context).push(child.route,);
            },
            selected: _path == (child.path ?? child.title.toLowerCase()),
            selectedTileColor: _selectedColor,
            contentPadding: const EdgeInsets.only(left: 30),
            tileColor: _expansionTileBackgroundColor,
          ),
        );
      }).toList(),
    );
  }

  Widget _navigationItem({required MainNavigationItem mainNavigationItem}){
    return ListTile(
      leading: Icon(mainNavigationItem.iconData, color: Colors.white,),
      title: Text(mainNavigationItem.title, style: const TextStyle(color: Colors.white),),
      onTap: () {
        AutoRouter.of(context).push(mainNavigationItem.route,);
      },
      selected: _path == (mainNavigationItem.path ?? mainNavigationItem.title.toLowerCase()),
      selectedTileColor: _selectedColor,
      tileColor: _drawerBackgroundColor,
    );
  }
}


class MainNavigationItem{
  final String title;
  final IconData iconData;
  final PageRouteInfo route;
  final String? path;
  final List<MainNavigationItem> children;
  const MainNavigationItem({required this.title, this.iconData = Icons.home, required this.route, this.path, this.children = const [],});
}