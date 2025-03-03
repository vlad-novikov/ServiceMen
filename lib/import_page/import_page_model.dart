import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/date_filter_component_widget.dart';
import '/components/side_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'import_page_widget.dart' show ImportPageWidget;
import 'package:flutter/material.dart';

class ImportPageModel extends FlutterFlowModel<ImportPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  int? pageRowIndex = 0;

  TypeImportStruct? pageImportLine;
  void updatePageImportLineStruct(Function(TypeImportStruct) updateFn) {
    updateFn(pageImportLine ??= TypeImportStruct());
  }

  TasksRow? pageSupabaseLine;

  ///  State fields for stateful widgets in this page.

  // Model for SideNavigationComponent component.
  late SideNavigationComponentModel sideNavigationComponentModel;
  // Model for DateFilterComponent component.
  late DateFilterComponentModel dateFilterComponentModel;
  // Stores action output result for [Custom Action - uploadTasksFromExcelFile] action in ButtonReadXLSX widget.
  dynamic jsonImport;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? doerName;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? statusName;

  @override
  void initState(BuildContext context) {
    sideNavigationComponentModel =
        createModel(context, () => SideNavigationComponentModel());
    dateFilterComponentModel =
        createModel(context, () => DateFilterComponentModel());
  }

  @override
  void dispose() {
    sideNavigationComponentModel.dispose();
    dateFilterComponentModel.dispose();
  }
}
