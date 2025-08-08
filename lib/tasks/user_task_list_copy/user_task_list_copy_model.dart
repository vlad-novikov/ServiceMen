import '/backend/supabase/supabase.dart';
import '/components/date_filter_compact_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_task_list_copy_widget.dart' show UserTaskListCopyWidget;
import 'package:flutter/material.dart';

class UserTaskListCopyModel extends FlutterFlowModel<UserTaskListCopyWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  String? pageUserName;

  String? pageUserId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in UserTaskListCopy widget.
  List<UsersRow>? queryCurrentUser;
  // Model for DateFilterCompactComponent component.
  late DateFilterCompactComponentModel dateFilterCompactComponentModel;

  @override
  void initState(BuildContext context) {
    dateFilterCompactComponentModel =
        createModel(context, () => DateFilterCompactComponentModel());
  }

  @override
  void dispose() {
    dateFilterCompactComponentModel.dispose();
  }
}
