import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_edit_page_widget.dart' show UserEditPageWidget;
import 'package:flutter/material.dart';

class UserEditPageModel extends FlutterFlowModel<UserEditPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for SwitchIsAdminisytator widget.
  bool? switchIsAdminisytatorValue;
  // State field(s) for SwitchIsImporter widget.
  bool? switchIsImporterValue;
  // State field(s) for SwitchIsApplyee widget.
  bool? switchIsApplyeeValue;
  // State field(s) for SwitchIsDoer widget.
  bool? switchIsDoerValue;
  // State field(s) for SwitchIsAuditor widget.
  bool? switchIsAuditorValue;
  // State field(s) for SwitchIsAdministrator widget.
  bool? switchIsAdministratorValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
