import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'task_list_page_widget.dart' show TaskListPageWidget;
import 'package:flutter/material.dart';

class TaskListPageModel extends FlutterFlowModel<TaskListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextDateFilter widget.
  FocusNode? textDateFilterFocusNode;
  TextEditingController? textDateFilterTextController;
  String? Function(BuildContext, String?)?
      textDateFilterTextControllerValidator;
  DateTime? datePicked;
  Stream<List<TasksRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textDateFilterFocusNode?.dispose();
    textDateFilterTextController?.dispose();
  }
}
