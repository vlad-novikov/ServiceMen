import '/backend/supabase/supabase.dart';
import '/components/date_filter_component_widget.dart';
import '/components/side_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_list_page_widget.dart' show TaskListPageWidget;
import 'package:flutter/material.dart';

class TaskListPageModel extends FlutterFlowModel<TaskListPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  String pageUserName = ' ';

  String pageUserId = ' ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in TaskListPage widget.
  List<UsersRow>? queryCurrentUser;
  // Model for SideNavigationComponent component.
  late SideNavigationComponentModel sideNavigationComponentModel;
  // Model for DateFilterComponent component.
  late DateFilterComponentModel dateFilterComponentModel;
  // Stores action output result for [Custom Action - importExcelToDatabase] action in ButtonReadXLSX widget.
  String? importResult;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ButtonTaskDoer widget.
  String? doerName;

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
