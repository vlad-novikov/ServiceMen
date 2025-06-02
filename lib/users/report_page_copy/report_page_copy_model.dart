import '/backend/supabase/supabase.dart';
import '/components/date_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'report_page_copy_widget.dart' show ReportPageCopyWidget;
import 'package:flutter/material.dart';

class ReportPageCopyModel extends FlutterFlowModel<ReportPageCopyWidget> {
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
