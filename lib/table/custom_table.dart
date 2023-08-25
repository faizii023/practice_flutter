import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class CustomTableView extends StatefulWidget {
  const CustomTableView({Key? key}) : super(key: key);

  @override
  State<CustomTableView> createState() => _CustomTableViewState();
}

class _CustomTableViewState extends State<CustomTableView> {
  var isHorizontalScrollbar = false;
  var isVerticalScrollbar = false;
  List<Map<String, Object>> coinList = [
    {
      "name": "Bitcoin",
      "imagePath": "assets/images/btc.png",
      "subName": "BTC",
    },
    {
      "name": "LTC",
      "imagePath": "assets/images/ltc.png",
      "subName": "LTC",
    },
    {
      "name": "Dogecoin",
      "imagePath": "assets/images/dogecoin.png",
      "subName": "DOGE"
    },
    {
      "name": "Polygon",
      "imagePath": "assets/images/polygon.png",
      "subName": "MATIC"
    },
    {
      "name": "Solana",
      "imagePath": "assets/images/solana.png",
      "subName": "SOL"
    },
    {
      "name": "Shiba INU",
      "imagePath": "assets/images/shiba.png",
      "subName": "SHIB"
    },
    {
      "name": "Litecoin",
      "imagePath": "assets/images/litecoin.png",
      "subName": "LTC"
    },
    {
      "name": "TRON",
      "imagePath": "assets/images/tron.png",
      "subName": "TRX",
    },
    {
      "name": "Cardano",
      "imagePath": "assets/images/cardano.png",
      "subName": "ADA"
    },
    {
      "name": "Chiliz",
      "imagePath": "assets/images/chiliz.png",
      "subName": "CHZ"
    },
    {
      "name": "Bitcoin",
      "imagePath": "assets/images/btc.png",
      "subName": "BTC",
    },
    {
      "name": "LTC",
      "imagePath": "assets/images/ltc.png",
      "subName": "LTC",
    },
    {
      "name": "Dogecoin",
      "imagePath": "assets/images/dogecoin.png",
      "subName": "DOGE"
    },
    {
      "name": "Polygon",
      "imagePath": "assets/images/polygon.png",
      "subName": "MATIC"
    },
    {
      "name": "Solana",
      "imagePath": "assets/images/solana.png",
      "subName": "SOL"
    },
    {
      "name": "Shiba INU",
      "imagePath": "assets/images/shiba.png",
      "subName": "SHIB"
    },
    {
      "name": "Litecoin",
      "imagePath": "assets/images/litecoin.png",
      "subName": "LTC"
    },
    {
      "name": "TRON",
      "imagePath": "assets/images/tron.png",
      "subName": "TRX",
    },
    {
      "name": "Cardano",
      "imagePath": "assets/images/cardano.png",
      "subName": "ADA"
    },
    {
      "name": "Chiliz",
      "imagePath": "assets/images/chiliz.png",
      "subName": "CHZ"
    },
  ];
  final columns = 10;
  final rows = 20;
  List<String> titleColumn = ["Categories", "24 hrs Volume"];
  List<String> titleRow = [];

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

  /// Simple generator for row title
  List<String> makeTitleRow() => List.generate(rows, (i) => 'Left $i');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final titleColumn = makeTitleColumn();

    double screenWidth = MediaQuery.of(context).size.width;
    var _colorVerticalBorder = Colors.amber;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                style: BorderStyle.solid,
                color: Colors.grey,
              ),
            ),
          ),
          child: StickyHeadersTable(
            columnsLength: titleColumn.length,
            rowsLength: makeTitleRow().length,
            columnsTitleBuilder: (i) => Text(
              titleColumn[i],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            rowsTitleBuilder: (i) => Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            coinList[i]["imagePath"].toString(),
                            height: 25,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coinList[i]["name"].toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                coinList[i]["subName"].toString(),
                                style: const TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10,
                  ),
                ],
              ),
            ),
            contentCellBuilder: (i, j) => Text(
              makeData()[i][j],
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            showVerticalScrollbar: false,
            legendCell: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: const Text(
                        "Coins",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.1,
                  ),
                ],
              ),
            ),
            cellDimensions: CellDimensions.uniform(
              width: (screenWidth / (titleColumn.length +0.5)),
              height: 62,
            ),
          ),
        ),
      ),
    );
  }
}

// class TableCell extends StatelessWidget {
//   TableCell.content(
//     this.text, {
//     this.textStyle,
//     this.cellDimensions = CellDimensions.base,
//     this.colorBg = Colors.white,
//     this.onTap,
//   })  : cellWidth = cellDimensions.contentCellWidth,
//         cellHeight = cellDimensions.contentCellHeight,
//         _colorHorizontalBorder = Colors.amber,
//         _colorVerticalBorder = Colors.black38,
//         _textAlign = TextAlign.center,
//         _padding = EdgeInsets.zero;
//
//   TableCell.legend(
//     this.text, {
//     this.textStyle,
//     this.cellDimensions = CellDimensions.base,
//     this.colorBg = Colors.amber,
//     this.onTap,
//   })  : cellWidth = cellDimensions.stickyLegendWidth,
//         cellHeight = cellDimensions.stickyLegendHeight,
//         _colorHorizontalBorder = Colors.white,
//         _colorVerticalBorder = Colors.amber,
//         _textAlign = TextAlign.start,
//         _padding = EdgeInsets.only(left: 24.0);
//
//   TableCell.stickyRow(
//     this.text, {
//     this.textStyle,
//     this.cellDimensions = CellDimensions.base,
//     this.colorBg = Colors.amber,
//     this.onTap,
//   })  : cellWidth = cellDimensions.contentCellWidth,
//         cellHeight = cellDimensions.stickyLegendHeight,
//         _colorHorizontalBorder = Colors.white,
//         _colorVerticalBorder = Colors.amber,
//         _textAlign = TextAlign.center,
//         _padding = EdgeInsets.zero;
//
//   TableCell.stickyColumn(
//     this.text, {
//     this.textStyle,
//     this.cellDimensions = CellDimensions.base,
//     this.colorBg = Colors.white,
//     this.onTap,
//   })  : cellWidth = cellDimensions.stickyLegendWidth,
//         cellHeight = cellDimensions.contentCellHeight,
//         _colorHorizontalBorder = Colors.amber,
//         _colorVerticalBorder = Colors.black38,
//         _textAlign = TextAlign.start,
//         _padding = EdgeInsets.only(left: 24.0);
//
//   final CellDimensions cellDimensions;
//
//   final String text;
//   final Function()? onTap;
//
//   final double? cellWidth;
//   final double? cellHeight;
//
//   final Color colorBg;
//   final Color _colorHorizontalBorder;
//   final Color _colorVerticalBorder;
//
//   final TextAlign _textAlign;
//   final EdgeInsets _padding;
//
//   final TextStyle? textStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: cellWidth,
//         height: cellHeight,
//         padding: _padding,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(horizontal: 2.0),
//                 child: Text(
//                   text,
//                   style: textStyle,
//                   maxLines: 2,
//                   textAlign: _textAlign,
//                 ),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 1.1,
//             ),
//           ],
//         ),
//         decoration: BoxDecoration(
//             border: Border(
//               left: BorderSide(color: _colorHorizontalBorder),
//               right: BorderSide(color: _colorHorizontalBorder),
//             ),
//             color: colorBg),
//       ),
//     );
//   }
// }
