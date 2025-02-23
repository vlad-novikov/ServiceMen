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

  ///  State fields for stateful widgets in this page.

  // Model for SideNavigationComponent component.
  late SideNavigationComponentModel sideNavigationComponentModel;
  // Model for DateFilterComponent component.
  late DateFilterComponentModel dateFilterComponentModel;
  // Stores action output result for [Custom Action - uploadExcelFile] action in Button widget.
  dynamic excelJSON;
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
