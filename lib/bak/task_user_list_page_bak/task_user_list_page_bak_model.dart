import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_user_list_page_bak_widget.dart' show TaskUserListPageBakWidget;
import 'package:flutter/material.dart';

class TaskUserListPageBakModel
    extends FlutterFlowModel<TaskUserListPageBakWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  Stream<List<TasksRow>>? listViewSupabaseStream;
  // State field(s) for Checkbox widget.
  Map<TasksRow, bool> checkboxValueMap1 = {};
  List<TasksRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<TasksRow, bool> checkboxValueMap2 = {};
  List<TasksRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<TasksRow, bool> checkboxValueMap3 = {};
  List<TasksRow> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
