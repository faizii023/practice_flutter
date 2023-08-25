import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class ColumnWidthInPercentPage extends StatefulWidget {
  @override
  State<ColumnWidthInPercentPage> createState() =>
      _ColumnWidthInPercentPageState();
}

class _ColumnWidthInPercentPageState extends State<ColumnWidthInPercentPage> {
  final columns = 3;

  final rows = 20;

  List<List<String>> makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < columns; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('L$j : T$i');
      }
      output.add(row);
    }
    return output;
  }

  /// Simple generator for column title
  List<String> makeTitleColumn() => List.generate(columns, (i) => 'Top $i');
  List<String> items = ["Market Cap", "Price(USD)", "24h%"];

  /// Simple generator for row title
  List<String> makeTitleRow() => List.generate(rows, (i) => '$i');

  @override
  void initState() {
    super.initState();
    debugPrint(makeTitleColumn().length.toString());
  }

  @override
  Widget build(BuildContext context) {
    final titleColumn = makeTitleColumn();
    final titleRow = makeTitleRow();
    final data = makeData();

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StickyHeadersTable(
        columnsLength: items.length,
        rowsLength: titleRow.length,
        columnsTitleBuilder: (i) => Text(items[i]),
        rowsTitleBuilder:(i) => Text(titleRow[i]),
        contentCellBuilder: (i, j) => Text(data[i][j]),
        showVerticalScrollbar: false,
        legendCell: Text('#'),
        cellDimensions: CellDimensions.uniform(
          width: (screenWidth / (titleColumn.length + 1)),
          height: 50,
        ),
      ),
    );
  }
  void doNothing(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: Text("You have raised a Alert Dialog Box, $text "),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.black45,
              padding: const EdgeInsets.all(14),
              child: const Text(
                "okay",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
