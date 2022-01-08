import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Material(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.speed,),
              onTap: () {

              },
              title: const Text('Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
