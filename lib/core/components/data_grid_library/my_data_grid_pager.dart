import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'my_data_grid_data_source.dart';

class MyDataGridPager<T> extends StatelessWidget {
  final MyDataGridDataSource<T> delegate;
  const MyDataGridPager({Key? key, required this.delegate,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDataPager(
      delegate: delegate,
      pageCount: delegate.orders.length / delegate.rowsPerPage,
      direction: Axis.horizontal,
    );
  }
}
