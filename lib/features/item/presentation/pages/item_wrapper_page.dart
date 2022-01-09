import 'package:flutter/material.dart';

class ItemWrapperPage extends StatelessWidget {
  const ItemWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Item Wrapper Page'),
        ),
      ),
    );
  }
}
