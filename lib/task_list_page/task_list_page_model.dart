import '/flutter_flow/flutter_flow_util.dart';
import 'task_list_page_widget.dart' show TaskListPageWidget;
import 'package:flutter/material.dart';

class TaskListPageModel extends FlutterFlowModel<TaskListPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? doerName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
