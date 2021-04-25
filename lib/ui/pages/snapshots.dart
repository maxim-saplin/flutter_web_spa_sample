import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_web_spa_sample/model/data/snapshot_list.dart';
import 'package:flutter_web_spa_sample/model/presentation/table_settings.dart';
import 'package:flutter_web_spa_sample/ui/common/column_settings.dart';
import 'package:flutter_web_spa_sample/ui/common/context_menu.dart';
import 'package:flutter_web_spa_sample/ui/common/master_page.dart';
import 'package:flutter_web_spa_sample/ui/common/paginated_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Snapshots extends StatelessWidget {
  Snapshots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasterPage(
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            child: Text('Your ads here, call 1-800-CVDATABANK'),
            onTap: () => print('Tap'),
            onLongPress: () => print('Long'),
            onSecondaryTap: () => print('Secondary'),
          ),
          ColumnSettings(
              tableSettings:
                  Provider.of<SnapshotListSettings>(context, listen: true),
              allColumns: Provider.of<SnapshotListModel>(context, listen: false)
                  .columnTitles
                  .toList())
        ]),
        _Table());
  }
}

class _Table extends StatelessWidget {
  const _Table({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SnapshotListModel>(context);

    List<PreferredSizeWidget> getContextMenuItems(int index) => [
          ContextMenuItem(
            content: Text('Open'),
            onTap: () => print('Open $index'),
          ),
          kIsWeb
              ? ContextMenuItem(content: Text('Open in new tab'))
              : PreferredSize(child: SizedBox(), preferredSize: Size(0, 0)),
          ContextMenuItem(content: Text('Duplucate')),
          ContextMenuItem(content: Text('Create Snapshot')),
          ContextMenuItem(content: Text('Remove')),
          ContextMenuItem(content: Text('Share')),
          ContextMenuItem(content: Text('Export to PDF')),
          ContextMenuItem(content: Text('Export to Word')),
        ];

    var columnSizes = {
      'Person': ColumnSize.L,
      'Position': ColumnSize.M,
      'AD User': ColumnSize.M,
      'Department': ColumnSize.S,
      'Division': ColumnSize.S,
      'Master CV': ColumnSize.S,
      'Check': ColumnSize.S,
      'Created': ColumnSize.S,
      'Last Modification': ColumnSize.S,
      'Travel': ColumnSize.S,
      'Shared': ColumnSize.S
    };

    var invisibleColumns =
        Provider.of<SnapshotListSettings>(context).invisibleColumns;

    return PaginatedTable(
        data: provider,
        invisibleColumns: invisibleColumns,
        columnSizes: columnSizes,
        getContextMenuItems: getContextMenuItems);
  }
}
