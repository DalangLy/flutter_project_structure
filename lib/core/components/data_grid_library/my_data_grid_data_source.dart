import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyDataGridDataSource<T> extends DataGridSource {
  final List<T> orders;
  late List<T> _paginatedOrders;
  final int rowsPerPage;
  final DataGridRow Function(T dataGridRow) mapDataGridRow;
  MyDataGridDataSource({required this.orders, required this.rowsPerPage, required this.mapDataGridRow,}){
    _paginatedOrders = orders.getRange(0, 5).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(dataGridCell.value
                  .toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < orders.length && endIndex <= orders.length) {
      _paginatedOrders =
          orders.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      _paginatedOrders = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedOrders.map<DataGridRow>((dataGridRow) {
      return mapDataGridRow(dataGridRow);
    }).toList(growable: false);
  }
}