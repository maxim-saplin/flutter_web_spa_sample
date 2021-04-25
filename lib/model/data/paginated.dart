import 'package:flutter/material.dart';

class ModelRow {
  final dynamic id;
  final List<String> values;

  ModelRow(this.id, this.values);
}

abstract class PaginatedDataModel extends ChangeNotifier {
  int get totalRecords;

  int _pageSize = 20;

  int get pageSize => _pageSize;

  String get errorMessage;

  void setPageSize(int size) {
    if (size != _pageSize) {
      _pageSize = size;
      if (totalPages < _currentPage) _currentPage = totalPages;
      loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
        _isLoading = false;
        notifyListeners();
      });

      _isLoading = true;
      notifyListeners();
    }
  }

  Set<String> _invisibleColumns = {};
  Set<String>? _visibleColumns;

  Set<String> get invisibleColumns => _invisibleColumns;

  /// Set this value to hide certain columns from the output and do not request extra data
  set invisibleColumns(Set<String> values) {
    _invisibleColumns = values;
    _visibleColumns =
        columnTitles.where((c) => !_invisibleColumns.contains(c)).toSet();
  }

  Set<String> get visibleColumns =>
      _visibleColumns == null ? columnTitles : _visibleColumns!;

  Future<void> loadData(
      String column, bool ascending, Map<String, Set<String>> filterValues);

  int _currentPage = 1;

  int get currentPage => _currentPage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setCurrentPage(int pageNumber, [bool forceReload = false]) {
    if (pageNumber > totalPages) pageNumber = totalPages;
    if (pageNumber < 1) pageNumber = 1;

    if (_currentPage != pageNumber || forceReload) {
      _currentPage = pageNumber;
      loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
        _isLoading = false;
        notifyListeners();
      });

      _isLoading = true;
      notifyListeners();
    }
  }

  Map<String, Set<String>> _filteredColumns = {};

  Map<String, Set<String>> get filteredColumns => _filteredColumns;

  void setFilter(String column, Set<String> values) {
    if (values.isNotEmpty) {
      filteredColumns[column] = values;
    } else {
      filteredColumns.remove(column);
    }

    loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
      _isLoading = false;
      //if (_currentPage > totalPages) _currentPage = max(totalPages, 1);
      _currentPage =
          1; // reset page number to avoid sending to server to large page number and potntially deal with server errors
      notifyListeners();
    });
    _isLoading = true;
    notifyListeners();
  }

  void clearFilters() {
    if (_filteredColumns.isNotEmpty) {
      _filteredColumns.clear();
      loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
        _isLoading = false;
        notifyListeners();
      });
      _isLoading = true;
      notifyListeners();
    }
  }

  void clearSorting() {
    if (_sortByColumn.isNotEmpty) {
      _sortByColumn = '';
      loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
        _isLoading = false;
        notifyListeners();
      });
      _isLoading = true;
      notifyListeners();
    }
  }

  String _sortByColumn = '';
  bool _sortAscending = false;

  String get sortByColumn => _sortByColumn;
  bool get sortAscending => _sortAscending;

  void setSorting(String column, bool ascending) {
    if (_sortByColumn != column || _sortAscending != ascending) {
      _sortByColumn = column;
      _sortAscending = ascending;
      loadData(_sortByColumn, sortAscending, _filteredColumns).whenComplete(() {
        _isLoading = false;
        notifyListeners();
      });

      _isLoading = true;
      notifyListeners();
    }
  }

  int get totalPages =>
      (totalRecords / pageSize).floor() +
      (totalRecords % pageSize == 0 ? 0 : 1);

  Set<String> get columnTitles;
  List<ModelRow> get currentRows;

  Future<List<String>> getDistinctValuesForColumn(String column);
}
