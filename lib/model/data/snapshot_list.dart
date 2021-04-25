import 'dart:math';

import 'package:flutter_web_spa_sample/misc/guid.dart';
import 'package:flutter_web_spa_sample/model/data/paginated.dart';

abstract class SnapshotListModel extends PaginatedDataModel {}

class FakeSnapshotListModel extends SnapshotListModel {
  FakeSnapshotListModel() {
    setCurrentPage(1, true);
  }

  @override
  Set<String> get columnTitles => <String>{
        'Person',
        'Position',
        'AD User',
        'Department',
        'Division',
        'Master CV',
        'Check',
        'Created',
        'Last Modification',
        'Travel',
        'Shared'
      };

  static Map<String, int> get _titlesToValueIndex => <String, int>{
        'Person': 0,
        'Position': 1,
        'AD User': 2,
        'Department': 3,
        'Division': 4,
        'Master CV': 5,
        'Check': 6,
        'Created': 7,
        'Last Modification': 8,
        'Travel': 9,
        'Shared': 10
      };

  static Random _random = Random();

  static const _values = <List<String>>[
    <String>[
      'Connor, Sarah',
      'Lead Developer',
      'Sarah Connor',
      '.NET',
      'Development',
      'Yes',
      'Success',
      '10/24/2014 16:59:27',
      '11/24/2014 16:59:27',
      '6 month',
      'Yes'
    ],
    <String>[
      'Connor, John',
      'Senior Developer',
      'John Connor',
      '.NET',
      'Development',
      'Yes',
      'Warning',
      '10/25/2014 16:59:27',
      '11/24/2015 01:59:27',
      'No',
      'Link'
    ],
    <String>[
      'Jackson, Michael',
      'Lead Tester',
      'Michael Jackson',
      'Testing',
      'Testing',
      'Yes',
      'Success',
      '10/26/2014 10:59:59',
      '11/24/2021 23:59:27',
      '6 month',
      'Internal'
    ]
  ];

  Future<void> loadData(
      String column, bool ascending, Map<String, Set<String>> filterValues) {
    if (_allRows.isEmpty) {
      _allRows = List<ModelRow>.generate(totalRecords,
          (index) => ModelRow(GUIDGen.generate(), _values[_random.nextInt(3)]));
    }
    _pageRowsAllValues = _allRows.sublist((currentPage - 1) * pageSize,
        min(currentPage * pageSize, totalRecords));
    _pageRowsOnlyVisibleValues = [];
    return Future.delayed(Duration(milliseconds: 0), () {});
  }

  List<ModelRow> _allRows = [];
  List<ModelRow> _pageRowsAllValues = [];
  List<ModelRow> _pageRowsOnlyVisibleValues = [];
  Set<String> _prevVisibleColumns = {};

  @override
  List<ModelRow> get currentRows {
    if (_pageRowsOnlyVisibleValues.isEmpty ||
        !(_prevVisibleColumns.containsAll(visibleColumns) &&
            visibleColumns.containsAll(_prevVisibleColumns))) {
      _prevVisibleColumns = visibleColumns;
      _pageRowsOnlyVisibleValues = List<ModelRow>.generate(
          min(pageSize, _pageRowsAllValues.length),
          (index) => ModelRow(
              _pageRowsAllValues[index].id,
              visibleColumns
                  .map<String>((c) =>
                      _pageRowsAllValues[index].values[_titlesToValueIndex[c]!])
                  .toList()));
    }

    return _pageRowsOnlyVisibleValues;
  }

  @override
  int get totalRecords => 1742;

  @override
  Future<List<String>> getDistinctValuesForColumn(String column) {
    if (!columnTitles.contains(column)) throw 'Column not found';
    return Future<List<String>>.delayed(
        Duration(seconds: 1),
        () => List<String>.generate(
            _values.length, (i) => _values[i][_titlesToValueIndex[column]!]));
  }

  @override
  String get errorMessage => '';
}
