import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter_web_spa_sample/model/presentation/table_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_spa_sample/misc/i18n.dart';

import 'elements.dart';

class ColumnSettings extends HookWidget {
  const ColumnSettings(
      {Key? key, required this.tableSettings, required this.allColumns})
      : super(key: key);

  final TableSettings tableSettings;
  final List<String> allColumns;

  @override
  Widget build(BuildContext context) {
    // This widget is asked to be rebuilt up the stream upon Provider.of()
    // retuest in the parent. _ColumnSettingsPopup widget is built once
    // when the pop-up is shown (via builder) and _ColumnSettings build method won't trigger
    // updates to _ColumnSettingsPopup. In order to avoid dependencies on Privder.of
    // inside these 2 widgetsa workaround with ValueNotifier is used
    var notifier = useValueNotifier(0);
    // Complete this build phase and run rebuild of _ColumnSettingsPopup
    // via scheduling it after the current operation is complete
    // and avoid excception due tu premature rebuild request to _ColumnSettingsPopup
    Timer.run(() => notifier.value++);

    return CustomPopupMenu(
        child: Icon(Icons.settings, color: Colors.white),
        pressType: PressType.singleClick,
        showArrow: false,
        menuBuilder: () => _ColumnSettingsPopup(
              tableSettings: tableSettings,
              allColumns: allColumns,
              notifier: notifier,
            ));
  }
}

class _ColumnSettingsPopup extends HookWidget {
  const _ColumnSettingsPopup(
      {Key? key,
      required this.tableSettings,
      required this.allColumns,
      required this.notifier})
      : super(key: key);

  final TableSettings tableSettings;
  final List<String> allColumns;
  final ValueNotifier notifier;

  @override
  Widget build(BuildContext context) {
    useValueListenable(notifier);
    return Padding(
        padding: EdgeInsets.only(top: 1),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          width: 255,
          height: 440,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Choose visible columns ('.i18n +
                  '${tableSettings.invisibleColumns.isEmpty ? allColumns.length : allColumns.length - tableSettings.invisibleColumns.length}'
                      '/${allColumns.length}):'),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          children:
                              List<Widget>.generate(allColumns.length + 1, (i) {
                            var e = i == 0 ? '(Select all)' : allColumns[i - 1];
                            var checked = i == 0
                                ? tableSettings.invisibleColumns.isEmpty
                                : tableSettings.invisibleColumns.isEmpty ||
                                    !tableSettings.invisibleColumns.contains(e);

                            return SizedBox(
                                height: 28,
                                child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0),
                                    horizontalTitleGap: 0,
                                    title: Text(e.i18n),
                                    leading: Checkbox(
                                      value: checked, // all inclussions
                                      onChanged: (value) {
                                        if (value != null) {
                                          if (i == 0) {
                                            if (value)
                                              tableSettings.invisibleColumns =
                                                  null;
                                            else
                                              tableSettings.invisibleColumns =
                                                  allColumns.toSet();
                                          } else {
                                            tableSettings.setColumnVisibility(
                                                e, value);
                                          }
                                        }
                                      },
                                    )));
                          })))),
              SizedBox(
                height: 10,
              ),
              Text('Filter presets:'),
              Row(children: [
                SizedBox(
                    height: 24,
                    width: 165,
                    child: TextInput(
                      value: '',
                      onChanged: (v) {},
                    )),
                SizedBox(
                    width: 24,
                    child: IconButton(icon: Icon(Icons.add), onPressed: () {})),
                IconButton(icon: Icon(Icons.remove), onPressed: () {}),
              ])
            ],
          ),
        ));
  }
}
