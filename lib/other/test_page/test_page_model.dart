import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/date_filter_component_widget.dart';
import '/components/side_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'test_page_widget.dart' show TestPageWidget;
import 'package:flutter/material.dart';

class TestPageModel extends FlutterFlowModel<TestPageWidget> {
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
  // Stores action output result for [Custom Action - uploadExcelFileToJSON] action in ButtonReadXLSX widget.
  dynamic jsonImport;
  // Stores action output result for [Custom Action - existenceCheckByDateAndLine] action in ButtonGetId widget.
  bool? tttt;
  // Stores action output result for [Custom Action - getMaxLineToDate] action in ButtonMax widget.
  int? maxLine;

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
