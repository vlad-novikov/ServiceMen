import '/components/date_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_task_list_page_widget.dart' show UserTaskListPageWidget;
import 'package:flutter/material.dart';

class UserTaskListPageModel extends FlutterFlowModel<UserTaskListPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  String? pageUserName;

  String? pageUserId;

  ///  State fields for stateful widgets in this page.

  // Model for DateFilterComponent component.
  late DateFilterComponentModel dateFilterComponentModel;

  @override
  void initState(BuildContext context) {
    dateFilterComponentModel =
        createModel(context, () => DateFilterComponentModel());
  }

  @override
  void dispose() {
    dateFilterComponentModel.dispose();
  }
}
