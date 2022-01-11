import 'package:flutter/material.dart';
import 'package:project_structure/features/item/presentation/widgets/item_data_table.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: ItemDataTable(),
        ),
      ),
    );
  }
}
