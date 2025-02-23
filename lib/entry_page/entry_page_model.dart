import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entry_page_widget.dart' show EntryPageWidget;
import 'package:flutter/material.dart';

class EntryPageModel extends FlutterFlowModel<EntryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
  // State field(s) for TextField2 widget.
  FocusNode? textField2FocusNode;
  TextEditingController? textField2TextController;
  String? Function(BuildContext, String?)? textField2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();

    textField2FocusNode?.dispose();
    textField2TextController?.dispose();
  }
}
