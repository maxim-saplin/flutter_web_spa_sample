import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_web_spa_sample/model/presentation/table_settings.dart';
import 'package:flutter_web_spa_sample/ui/common/column_settings.dart';
import 'package:flutter_web_spa_sample/ui/common/context_menu.dart';
import 'package:flutter_web_spa_sample/model/data/cv_list.dart';
import 'package:flutter_web_spa_sample/ui/common/paginated_table.dart';
import 'package:flutter_web_spa_sample/ui/common/elements.dart';
import 'package:flutter_web_spa_sample/ui/common/icons.dart';
import 'package:flutter_web_spa_sample/ui/common/master_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_spa_sample/misc/i18n.dart';

class CvList extends StatelessWidget {
  CvList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasterPage(_BlueStripe(), _Table());
  }
}

class _Table extends StatelessWidget {
  const _Table({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CvListModel>(context);

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
      'ADUser': ColumnSize.S,
      'Department': ColumnSize.S,
      'SnapshotName': ColumnSize.S,
      'Visibility': ColumnSize.S,
      'Created': ColumnSize.S,
      'LastModification': ColumnSize.S,
      'SharedTill': ColumnSize.S,
      'Travel': ColumnSize.S,
      'Location': ColumnSize.S,
      'Languages': ColumnSize.M,
      'Dismissed': ColumnSize.S,
      'HasCertificates': ColumnSize.S,
      'Division': ColumnSize.S,
      'Check': ColumnSize.S,
      'Gender': ColumnSize.S,
      'MaritalStatus': ColumnSize.S,
      'MilitaryStatus': ColumnSize.S,
      'Speciality': ColumnSize.S,
      'Degree': ColumnSize.S,
      'CreatedBy': ColumnSize.S,
      'UpdatedBy': ColumnSize.S
    };

    var invisibleColumns =
        Provider.of<CvListSettings>(context).invisibleColumns;

    return PaginatedTable(
        data: provider,
        invisibleColumns: invisibleColumns,
        columnSizes: columnSizes,
        getContextMenuItems: getContextMenuItems);
  }
}

class _BlueStripe extends StatelessWidget {
  const _BlueStripe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        AssetIconButton(
          AssetIcons.create,
          'Create CV'.i18n,
          onTap: () => showDialog(
              context: context, builder: (context) => _Dialog(message: 'Bam!')),
        ),
        AssetIconButton(
          AssetIcons.createBlank,
          'Create CV for candidate'.i18n,
          onTap: () => showDialog(
              context: context, builder: (context) => _Dialog(message: 'Bam!')),
        ),
        AssetIconButton(
          AssetIcons.upload,
          'Upload CV'.i18n,
          onTap: () => showDialog(
              context: context,
              builder: (context) => _Dialog(message: 'Ta-dam!')),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
                width: 146,
                height: 30,
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        fillColor: Colors.blue[800],
                        hintText: 'CV Search'.i18n,
                        filled: true,
                        hoverColor: Colors.blue[700],
                        hintStyle: TextStyle(color: Colors.white))))),
        Padding(
          child: _AdvancedSearch(),
          padding: EdgeInsets.only(right: 20),
        ),
        AssetIconButton(
          AssetIcons.help,
          '',
          padded: false,
          narrow: true,
        ),
        ColumnSettings(
            tableSettings: Provider.of<CvListSettings>(context, listen: true),
            allColumns: Provider.of<CvListModel>(context, listen: false)
                .columnTitles
                .toList())
      ]),
    ]);
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _AdvancedSearch extends StatelessWidget {
  static CustomPopupMenuController _popupController =
      CustomPopupMenuController();

  const _AdvancedSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
        controller: _popupController,
        child: Icon(Icons.search, color: Colors.white),
        pressType: PressType.singleClick,
        showArrow: false,
        menuBuilder: () =>
            _AdvancedSearchPopup(popupController: _popupController));
  }
}

class _AdvancedSearchPopup extends HookWidget {
  const _AdvancedSearchPopup({
    Key? key,
    required CustomPopupMenuController popupController,
  })  : _popupController = popupController,
        super(key: key);

  final CustomPopupMenuController _popupController;

  @override
  Widget build(BuildContext context) {
    var _allInclusions = useState<bool>(true);
    var _serachInProjects = useState<bool>(true);
    var _searchInSkillMatrix = useState<bool>(true);
    var _searchOtherParts = useState<bool>(true);

    return Padding(
        padding: EdgeInsets.only(top: 1),
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(12, 2, 12, 12),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 40,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: const Text('All inclussions'),
                          subtitle: const Text(
                              'E.g. "ax" finds both "AJAX" and "Dynamics AX"'),
                          leading: Radio<bool>(
                            value: true, // all inclussions
                            groupValue: _allInclusions.value,
                            onChanged: (bool? value) =>
                                _allInclusions.value = true,
                          ))),
                  SizedBox(
                      height: 40,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: const Text('Match whole word'),
                          subtitle:
                              const Text('E.g. "ax" finds only "Dynamics AX"'),
                          leading: Radio<bool>(
                            value: false, // all inclussions
                            groupValue: _allInclusions.value,
                            onChanged: (bool? value) =>
                                _allInclusions.value = false,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 24,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: const Text('Search in "Projects"'),
                          leading: Checkbox(
                            value: _serachInProjects.value, // all inclussions
                            onChanged: (value) => _serachInProjects.value =
                                !_serachInProjects.value,
                          ))),
                  SizedBox(
                      height: 24,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: const Text('Search in "Skill Matrix"'),
                          leading: Checkbox(
                            value:
                                _searchInSkillMatrix.value, // all inclussions
                            onChanged: (bool? value) => _searchInSkillMatrix
                                .value = !_searchInSkillMatrix.value,
                          ))),
                  SizedBox(
                      height: 24,
                      child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 0,
                          title: const Text('Search in other parts of CV'),
                          leading: Checkbox(
                            value: _searchOtherParts.value, // all inclussions
                            onChanged: (bool? value) => _searchOtherParts
                                .value = !_searchOtherParts.value,
                          ))),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: SimpleButton(
                        title: 'OK',
                        onPressed: () => _popupController.hideMenu(),
                      ))
                ],
              ),
            )));
  }
}
