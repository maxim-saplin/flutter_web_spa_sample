import 'package:flutter_web_spa_sample/ui/common/master_page.dart';
import 'package:flutter/material.dart';

class Glossary extends StatelessWidget {
  Glossary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasterPage(
        Center(child: Text('Your ads here, call 1-800-CVTOOL')),

        // CustomDataTable(columns: [
        //   DataColumn2(label: Text('X' * 1000))
        // ], rows: [
        //   DataRow2(cells: [DataCell2(Text('Y' * 1000))])
        // ])
        Center(child: Text('Glossary')));
  }
}
