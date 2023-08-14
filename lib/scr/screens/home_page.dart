import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(.5),
            1: FractionColumnWidth(.25),
            2: FractionColumnWidth(.25),
          },
          children: [
            buildRow(['abu','14','Ceil3']),
            buildRow(['ali','12','Ceil3']),
            buildRow(['Ibn','13','Ceil3']),
          ],
        ),
      ),
    );
  }
  TableRow buildRow(List<String> cells) => TableRow(
    children: cells.map((e) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(e),
    )).toList(),
  );
}
