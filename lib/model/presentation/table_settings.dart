import 'package:flutter_web_spa_sample/misc/preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SnapshotListSettings extends TableSettings {
  SnapshotListSettings() : super('SnapshotList', PreferencesSingleton.instance);
}

class CvListSettings extends TableSettings {
  CvListSettings() : super('CvList', PreferencesSingleton.instance);
}

abstract class TableSettings extends ChangeNotifier {
  static const String _pref = 'TableSettings_';
  static const String _prefVisibleColumns = 'VisibleColumns';
  final String tableName;
  String get visibleColumnsKey => _pref + tableName + _prefVisibleColumns;
  final SharedPreferences sharePref;
  TableSettings(this.tableName, this.sharePref);

  /// Null - all columns
  Set<String> get invisibleColumns {
    var val = sharePref.getString(visibleColumnsKey);

    if (val == null) return {};

    var cols = val.split('\n').toSet();
    return cols;
  }

  //List<String> _previousColumns = [];

  /// Null - all columns
  set invisibleColumns(Set<String>? columns) {
    if (columns == null || columns.isEmpty) {
      sharePref.remove(visibleColumnsKey);
      notifyListeners();
      return;
    }
    var val = columns.fold<String>(
        '', (previousValue, element) => previousValue + element + '\n');
    val = val.substring(0, val.length - 1);

    if (val != sharePref.getString(visibleColumnsKey)) {
      sharePref.setString(visibleColumnsKey, val);
      notifyListeners();
    }
  }

  void setColumnVisibility(String column, bool visible) {
    var x = invisibleColumns;
    if (x.isNotEmpty) {
      if (visible && x.contains(column)) {
        x.remove(column);
        invisibleColumns = x;
      } else if (!visible && !x.contains(column)) {
        x.add(column);
        invisibleColumns = x;
      }
    } else if (!visible) invisibleColumns = {column};
  }
}
