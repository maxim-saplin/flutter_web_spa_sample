import 'dart:async';
import 'dart:collection';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_web_spa_sample/model/data/paginated.dart';
import 'package:flutter_web_spa_sample/ui/common/context_menu.dart';
import 'package:flutter_web_spa_sample/ui/common/elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_spa_sample/misc/i18n.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight_text/highlight_text.dart';

class PaginatedTable extends HookWidget {
  static Widget w = SizedBox();

  const PaginatedTable(
      {Key? key,
      required this.data,
      required this.invisibleColumns,
      required this.columnSizes,
      this.getContextMenuItems})
      : super(key: key);

  final PaginatedDataModel data;
  final Set<String> invisibleColumns;
  final Map<String, ColumnSize> columnSizes;
  final List<PreferredSizeWidget> Function(int index)? getContextMenuItems;

  @override
  Widget build(BuildContext context) {
    var sw = Stopwatch()..start();

    try {
      // Show nothing if fetch is errored
      if (data.errorMessage.isNotEmpty) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Opps... Can\'t get data from the network'),
              IconButton(
                  onPressed: () {
                    data.setCurrentPage(data.currentPage, true);
                  },
                  icon: Icon(Icons.refresh))
            ]);
      }

      data.invisibleColumns = invisibleColumns.toSet();

      var prevInvisibleCoulumns = usePrevious<Set<String>>(invisibleColumns);

      var isLoading = data.isLoading;

      if (prevInvisibleCoulumns != null &&
          prevInvisibleCoulumns != invisibleColumns &&
          !invisibleColumns.containsAll(prevInvisibleCoulumns)) {
        isLoading = true;
        // setCurrentPage will cause rebuilding this widget  while it is still being built
        // and throw exception. Let this build pass go and schedule another build
        // when message queue is free of the current build
        Timer.run(() {
          data.setCurrentPage(data.currentPage, true);
        });
      }

      if (data.visibleColumns.isEmpty) {
        w = Center(child: Text('Nothing to show'));
        return w;
      }

      // Don't rebuild expensive table widget just to show it behind shade
      if (!isLoading) {
        print('Getting Model Rows: ${sw.elapsedMilliseconds}ms');
        var modelRows = data.currentRows;
        print('Model Rows received: ${sw.elapsedMilliseconds}ms');

        print('Getting Data Columns: ${sw.elapsedMilliseconds}ms');
        var columns = data.visibleColumns.map((column) {
          var size = ColumnSize.M;

          if (!columnSizes.containsKey(column)) {
            print('Column size not found for column: ' + column);
          } else {
            size = columnSizes[column]!;
          }

          return DataColumn2(
              size: size,
              label: _ColumnFilter(
                column,
                data,
                filterActive: data.filteredColumns.containsKey(column),
                sortingAsscending:
                    data.sortByColumn == column ? data.sortAscending : null,
              ));
        }).toList();
        print('Data Columns received: ${sw.elapsedMilliseconds}ms');

        print('Getting Data Rows: ${sw.elapsedMilliseconds}ms');
        var rows = List<DataRow2>.generate(modelRows.length, (index) {
          var r = data.currentRows[index];
          return DataRow2(
              color: MaterialStateColor.resolveWith((states) =>
                  index % 2 == 1 ? Colors.grey[200]! : Colors.transparent),
              onTap: () => print('tap'),
              onSecondaryTap: () {
                print('secondary tap');
              },
              onSecondaryTapDown: (d) => showContextMenu(
                  context: context,
                  position: d.globalPosition,
                  children: getContextMenuItems == null
                      ? []
                      : getContextMenuItems!(index)),
              cells: List<DataCell>.generate(
                  data.visibleColumns.length,
                  (i) => DataCell(
                        Text(r.values[i]),
                      ),
                  growable: false));
        }, growable: false);
        print('Data Rows received: ${sw.elapsedMilliseconds}ms');

        w = Column(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Stack(children: [
                // SingleChildScrollView(
                //     child: DataTable(
                //         columnSpacing: 0,
                //         headingRowHeight: 46,
                //         headingRowColor: MaterialStateProperty.resolveWith(
                //             (states) => Color(0xFFe5e5e5)),
                //         dataRowHeight: 36,
                //         columns: data.visibleColumns.map((column) {
                //           return DataColumn(
                //               label: Expanded(
                //                   child: _ColumnFilter(
                //             column,
                //             data,
                //             filterActive:
                //                 data.filteredColumns.containsKey(column),
                //             sortingAsscending: data.sortByColumn == column
                //                 ? data.sortAscending
                //                 : null,
                //           )));
                //         }).toList(),
                //         rows: List<DataRow>.generate(data.currentRows.length,
                //             (index) {
                //           var r = data.currentRows[index];
                //           return DataRow(
                //               color: MaterialStateColor.resolveWith((states) =>
                //                   index % 2 == 1
                //                       ? Colors.grey[200]!
                //                       : Colors.transparent),
                //               cells: List<DataCell>.generate(
                //                   data.visibleColumns.length,
                //                   (i) => DataCell(
                //                         Text(r.values[i]),
                //                       )));
                //         }))),
                DataTable2(
                    columnSpacing: 0,
                    headingRowHeight: 46,
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFFe5e5e5)),
                    dataRowHeight: 36,
                    columns: columns,
                    rows: rows),
                data.currentRows.length == 0
                    ? Center(child: Text('No data'))
                    : SizedBox()
              ])),
          SizedBox(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFEEEEEE)))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total: %s'.i18n.fill([data.totalRecords]),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('Page size: '.i18n,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<int>(
                            value: data.pageSize,
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                data.setPageSize(newValue);
                              }
                            },
                            items: <int>[20, 30, 50, 99, 1000]
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                          ),
                          IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: () => data.setCurrentPage(0)),
                          IconButton(
                              icon: Icon(Icons.arrow_left_sharp),
                              onPressed: () =>
                                  data.setCurrentPage(data.currentPage - 1)),
                          SizedBox(
                              height: 24,
                              width: 40,
                              child: TextInput(
                                  value: data.currentPage.toString(),
                                  onChanged: (v) {})),
                          IconButton(
                              icon: Icon(Icons.arrow_right_sharp),
                              onPressed: () =>
                                  data.setCurrentPage(data.currentPage + 1)),
                          IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: () =>
                                  data.setCurrentPage(data.totalPages)),
                        ],
                      )
                    ])),
            height: 40,
          )
        ]);
      }

      return Stack(children: [
        w,
        isLoading
            ? ColoredBox(
                color: Colors.white.withAlpha(90),
                child: Center(
                    child: FutureBuilder(
                        future: Future.delayed(
                            Duration(milliseconds: 450), () => true),
                        builder: (context, snapshot) => !snapshot.hasData
                            ? SizedBox()
                            : Container(
                                color: Theme.of(context).accentColor,
                                padding: EdgeInsets.all(7),
                                height: 60,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Loading\n'.i18n),
                                      SizedBox(
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              Theme.of(context).accentColor,
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Theme.of(context).primaryColor),
                                        ),
                                        width: 240,
                                      )
                                    ])))))
            : SizedBox(),
      ]);
    } finally {
      sw.stop();
      print('PaginatedTable built: ${sw.elapsedMilliseconds}ms');
    }
  }
}

class _ColumnFilter extends HookWidget {
  const _ColumnFilter(
    this.columnLabel,
    this.data, {
    this.filterActive = false,
    this.sortingAsscending,
    Key? key,
  }) : super(key: key);

  static CustomPopupMenuController _columnPopupController =
      CustomPopupMenuController();
  final String columnLabel;
  final bool filterActive;
  final bool? sortingAsscending;
  final PaginatedDataModel data;

  @override
  Widget build(BuildContext context) {
    var notifier = useValueNotifier(0);
    Timer.run(() => notifier.value++);
    return CustomPopupMenu(
        controller: _columnPopupController,
        child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                  left: -5,
                  child: Container(
                      width: 24,
                      child: !filterActive
                          ? sortingAsscending == null
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(
                                  sortingAsscending!
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  size: 18)
                          : Icon(Icons.filter_alt, size: 18))),
              Positioned(
                  left: 19,
                  child: Text(
                    columnLabel.i18n,
                    style: TextStyle(
                        fontWeight:
                            filterActive ? FontWeight.bold : FontWeight.normal),
                  )),
            ]),
        pressType: PressType.singleClick,
        showArrow: false,
        verticalMargin: 1,
        menuBuilder: () {
          //print('Show');
          return _ColumnFilterPopup(
            provider: data,
            column: columnLabel,
            columnPopupController: _columnPopupController,
            notifier: notifier,
          );
        });
  }
}

class _ColumnFilterPopup extends HookWidget {
  const _ColumnFilterPopup(
      {Key? key,
      required this.provider,
      required this.column,
      required CustomPopupMenuController columnPopupController,
      required this.notifier})
      : _columnPopupController = columnPopupController,
        super(key: key);

  final PaginatedDataModel provider;
  final String column;
  final CustomPopupMenuController _columnPopupController;
  final ValueNotifier notifier;

  @override
  Widget build(BuildContext context) {
    useValueListenable(notifier);
    var selectedValues = useValueNotifier<Set<String>>(
        provider.filteredColumns.containsKey(column)
            ? provider.filteredColumns[column]!
            : Set<String>());

    return IntrinsicWidth(
        child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.only(bottom: 10),
            width: 250,
            height: 200,
            child: FutureBuilder<List<String>>(
                future: provider.getDistinctValuesForColumn(column),
                builder: (context, snapshot) => !snapshot.hasData
                    ? (snapshot.error != null
                        ? Center(child: Text('ERROR. Can\'t fetch values'))
                        : Center(
                            child: CircularProgressIndicator(),
                          ))
                    : _ColumnFilterInputs(
                        snapshot.data ?? <String>[],
                        selectedValues,
                        provider.sortByColumn == column
                            ? provider.sortAscending
                            : null,
                        (ascending) => provider.setSorting(column, ascending),
                      ))),
        SizedBox(height: 2),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SimpleButton(
            title: 'Clear all',
            onPressed: () {
              provider.clearFilters();
              provider.clearSorting();
              _columnPopupController.hideMenu();
            },
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: SimpleButton(
                title: 'OK',
                onPressed: () {
                  if (selectedValues.value.isNotEmpty) {
                    provider.setFilter(column, selectedValues.value);
                  } else {
                    provider.setFilter(column, {});
                  }
                  _columnPopupController.hideMenu();
                },
              ))
        ])
      ]),
    ));
  }
}

class _ColumnFilterInputs extends HookWidget {
  const _ColumnFilterInputs(
      this.values, this.selectedValues, this.ascending, this.onSort);

  final List<String> values;
  final ValueNotifier<Set<String>> selectedValues;
  final bool? ascending;
  final Function(bool ascending) onSort;

  @override
  Widget build(BuildContext context) {
    var selected = useState(selectedValues.value);
    var searchText = useTextEditingController(text: '');

    Timer.run(() {
      selectedValues.value = selected.value;
    });

    var filteredValues = values;

    if (searchText.value.text.isNotEmpty) {
      var s = searchText.value.text.toLowerCase();
      filteredValues =
          values.where((e) => e.toLowerCase().contains(s)).toList();
    }

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            height: 30,
            width: 175,
            child: TextInput(
                controller: searchText,
                onChanged: (v) {
                  // ignore: invalid_use_of_visible_for_testing_member
                  selected.notifyListeners();
                })),
        SquareButton(
            icon: Icon(Icons.arrow_upward),
            flagged: (ascending ?? false),
            onPressed: () => onSort(false)),
        SquareButton(
            icon: Icon(Icons.arrow_downward),
            flagged: !(ascending ?? true),
            onPressed: () => onSort(true)),
      ]),
      SizedBox(height: 7),
      Flexible(
          fit: FlexFit.tight,
          child: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: ListView.builder(
                itemCount: filteredValues.length + 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 28,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: index == 0
                              ? Text('(Deselect all)'.i18n)
                              : (filteredValues == values
                                  ? Text(filteredValues[index - 1])
                                  : TextHighlight(
                                      text: filteredValues[index - 1],
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2!,
                                      words: LinkedHashMap<String,
                                          HighlightedWord>.from({
                                        searchText.text: HighlightedWord(
                                            onTap: () {},
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1!)
                                      }))),
                          leading: Checkbox(
                            value: index == 0
                                ? selected.value.length == 0
                                : selected.value.contains(filteredValues[
                                    index - 1]), // all inclussions
                            onChanged: (value) {
                              if (index == 0) {
                                if (value ?? false) {
                                  selected.value.clear();
                                } else {
                                  selected.value = filteredValues.toSet();
                                }
                              } else {
                                if (value ?? false) {
                                  selected.value.add(filteredValues[index - 1]);
                                } else {
                                  selected.value
                                      .remove(filteredValues[index - 1]);
                                }
                              }
                              // ignore: invalid_use_of_protected_member
                              selected.notifyListeners();
                            },
                          )));
                },
                scrollDirection: Axis.vertical,
              ))),
    ]);
  }
}
