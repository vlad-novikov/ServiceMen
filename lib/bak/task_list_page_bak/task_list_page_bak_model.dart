import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_list_page_bak_widget.dart' show TaskListPageBakWidget;
import 'package:flutter/material.dart';

class TaskListPageBakModel extends FlutterFlowModel<TaskListPageBakWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  Stream<List<TasksRow>>? listViewTasksSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
