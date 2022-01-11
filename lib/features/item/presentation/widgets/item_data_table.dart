import 'package:flutter/material.dart';
import 'package:project_structure/core/components/data_grid_library/my_data_grid.dart';
import 'package:project_structure/core/components/data_grid_library/my_data_grid_data_source.dart';
import 'package:project_structure/core/components/data_grid_library/my_data_grid_pager.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ItemDataTable extends StatefulWidget {
  const ItemDataTable({Key? key}) : super(key: key);

  @override
  _ItemDataTableState createState() => _ItemDataTableState();
}

class _ItemDataTableState extends State<ItemDataTable> {

  final List<Student> _orders = List.generate(1000, (index) => Student(id: index.toString(), name: 'student $index',));

  late final MyDataGridDataSource<Student> _studentDataSource = MyDataGridDataSource<Student>(orders: _orders, rowsPerPage: 15, mapDataGridRow: (dataGridRow) {
    return DataGridRow(cells: [
      DataGridCell(columnName: 'id', value: dataGridRow.id),
      DataGridCell(columnName: 'name', value: dataGridRow.name),
    ]);
  },);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(children: [
        SizedBox(
          height: constraint.maxHeight - 60.0,
          width: constraint.maxWidth,
          child: MyDataGrid(source: _studentDataSource,),
        ),
        SizedBox(
          height: 60.0,
          child: MyDataGridPager<Student>(delegate: _studentDataSource,),
        ),
      ]);
    });
  }
}

class Student{
  final String id;
  final String name;
  const Student({required this.id, required this.name,});
}