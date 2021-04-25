import 'dart:math';

import 'package:flutter_web_spa_sample/misc/guid.dart';
import 'package:flutter_web_spa_sample/model/data/paginated.dart';
import 'package:intl/intl.dart';
import '../../misc/auth.dart';
import '../../grpc/cv.pbgrpc.dart';

abstract class CvListModel extends PaginatedDataModel {}

// TODO - reload data when logining in after being logged out due to expired session
class CvListGrpcModel extends CvListModel {
  CvListGrpcModel(this.grpcAuthManager) {
    setCurrentPage(1, true);
  }

  final GrpcAuthManager grpcAuthManager;

  @override
  Set<String> get columnTitles => <String>{
        'Person',
        'Position',
        'ADUser',
        'Department',
        'SnapshotName',
        'Visibility',
        'Created',
        'LastModification',
        'SharedTill',
        'Travel',
        'Location',
        'Languages',
        'Dismissed',
        'HasCertificates',
        'Division',
        'Check',
        'Gender',
        'MaritalStatus',
        'MilitaryStatus',
        'Speciality',
        'Degree',
        'CreatedBy',
        'UpdatedBy'
      };

  CvServiceClient get client =>
      grpcAuthManager.getAuthenticatedClient<CvServiceClient>(
          (channel, options) => CvServiceClient(channel, options: options));

  List<Cv> _cvs = [];

  Future<void> loadData(String sortByColumn, bool sortAscending,
      Map<String, Set<String>> filterValues) async {
    try {
      var columns = visibleColumns.toList();

      var r = await client.getCvs(
        CvRequest(
            pageNumber: currentPage,
            itemsPerPage: pageSize,
            columns: columns,
            filters: filteredColumns.entries
                .map((e) => Filter(column: e.key, stringValues: e.value)),
            orderBy: sortByColumn,
            isDesc: !sortAscending),
      );

      _cvs = r.cvs;
      _totalRecords = r.totalItems.toInt();
      _errorMessage = '';
      _pageRowsOnlyVisibleValues = [];
    } catch (e) {
      _errorMessage = e.toString();
    }
  }

  List<ModelRow> _pageRowsOnlyVisibleValues = [];
  Set<String> _prevVisibleColumns = {};

  @override
  List<ModelRow> get currentRows {
    if (_pageRowsOnlyVisibleValues.isEmpty ||
        !(_prevVisibleColumns.containsAll(visibleColumns) &&
            visibleColumns.containsAll(_prevVisibleColumns))) {
      _prevVisibleColumns = visibleColumns;
      _pageRowsOnlyVisibleValues = List<ModelRow>.generate(
              min(pageSize, _cvs.length),
              (index) => ModelRow(
                  GUIDGen.generate(),
                  visibleColumns.map<String>((c) {
                    switch (c) {
                      case 'Person':
                        return _cvs[index].person;
                      case 'Position':
                        return _cvs[index].position;
                      case 'ADUser':
                        return _cvs[index].adUser;
                      case 'Department':
                        return _cvs[index].department;
                      case 'SnapshotName':
                        return _cvs[index].snapshotName;
                      case 'Visibility':
                        return _cvs[index].visibility;
                      case 'Created':
                        return DateFormat('yyyy-MM-dd kk:mm:ss')
                            .format(_cvs[index].created.toDateTime());
                      case 'LastModification':
                        return DateFormat('yyyy-MM-dd kk:mm:ss')
                            .format(_cvs[index].lastModification.toDateTime());
                      case 'SharedTill':
                        return DateFormat('yyyy-MM-dd kk:mm:ss')
                            .format(_cvs[index].sharedTill.toDateTime());
                      case 'Travel':
                        return _cvs[index].travel;
                      case 'Location':
                        return _cvs[index].location;
                      case 'Languages':
                        return _cvs[index].languages.fold(
                            "",
                            (previousValue, element) =>
                                previousValue +
                                (previousValue == '' ? '' : '; ') +
                                element);
                      case 'Dismissed':
                        return _cvs[index].dismissed.toString();
                      case 'HasCertificates':
                        return _cvs[index].hasCertificates.toString();
                      case 'Division':
                        return _cvs[index].division.toString();
                      case 'Check':
                        return _cvs[index].check_16.toString();
                      case 'Gender':
                        return _cvs[index].gender.toString();
                      case 'MaritalStatus':
                        return _cvs[index].maritalStatus.toString();
                      case 'MilitaryStatus':
                        return _cvs[index].militaryStatus.toString();
                      case 'Speciality':
                        return _cvs[index].speciality.toString();
                      case 'Degree':
                        return _cvs[index].degree.toString();
                      case 'CreatedBy':
                        return _cvs[index].createdBy.toString();
                      case 'UpdatedBy':
                        return _cvs[index].createdBy.toString();
                      default:
                        return '';
                    }
                  }).toList()),
              growable: false)
          .toList();
    }

    return _pageRowsOnlyVisibleValues;
  }

  int _totalRecords = 0;

  @override
  int get totalRecords => _totalRecords;

  @override
  Future<List<String>> getDistinctValuesForColumn(String column) async {
    var r = await client.getColumnDistinctValues(ColumnDistinctValuesRequest(
        columnName: column,
        filters: filteredColumns.entries
            .map((e) => Filter(column: e.key, stringValues: e.value))));
    return r.values;
  }

  String _errorMessage = '';

  @override
  String get errorMessage => _errorMessage;
}

class FakeCvListModel extends CvListModel {
  FakeCvListModel() {
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
