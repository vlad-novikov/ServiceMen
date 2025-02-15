import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_page_widget.dart' show ReportPageWidget;
import 'package:flutter/material.dart';

class ReportPageModel extends FlutterFlowModel<ReportPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  List<TasksRow> listTasks = [];
  void addToListTasks(TasksRow item) => listTasks.add(item);
  void removeFromListTasks(TasksRow item) => listTasks.remove(item);
  void removeAtIndexFromListTasks(int index) => listTasks.removeAt(index);
  void insertAtIndexInListTasks(int index, TasksRow item) =>
      listTasks.insert(index, item);
  void updateListTasksAtIndex(int index, Function(TasksRow) updateFn) =>
      listTasks[index] = updateFn(listTasks[index]);

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TasksRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
