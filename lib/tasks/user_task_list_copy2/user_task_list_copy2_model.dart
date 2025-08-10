import '/backend/supabase/supabase.dart';
import '/components/date_filter_compact_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_task_list_copy2_widget.dart' show UserTaskListCopy2Widget;
import 'package:flutter/material.dart';

class UserTaskListCopy2Model extends FlutterFlowModel<UserTaskListCopy2Widget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  String? pageUserName;

  String? pageUserId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in UserTaskListCopy2 widget.
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
