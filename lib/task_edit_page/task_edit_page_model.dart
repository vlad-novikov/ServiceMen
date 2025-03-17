import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_edit_page_widget.dart' show TaskEditPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TaskEditPageModel extends FlutterFlowModel<TaskEditPageWidget> {
  ///  Local state fields for this page.

  DateTime? pickedTransferDate;

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
  final textFieldMask3 = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextDoer widget.
  FocusNode? textDoerFocusNode;
  TextEditingController? textDoerTextController;
  String? Function(BuildContext, String?)? textDoerTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? doerName;
  // State field(s) for TextDoerDescription widget.
  FocusNode? textDoerDescriptionFocusNode;
  TextEditingController? textDoerDescriptionTextController;
  String? Function(BuildContext, String?)?
      textDoerDescriptionTextControllerValidator;
  // State field(s) for TextTaskStatus widget.
  FocusNode? textTaskStatusFocusNode;
  TextEditingController? textTaskStatusTextController;
  String? Function(BuildContext, String?)?
      textTaskStatusTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? statusName;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextFieldTransferDate widget.
  FocusNode? textFieldTransferDateFocusNode;
  TextEditingController? textFieldTransferDateTextController;
  final textFieldTransferDateMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)?
      textFieldTransferDateTextControllerValidator;
  DateTime? datePicked;

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

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textDoerFocusNode?.dispose();
    textDoerTextController?.dispose();

    textDoerDescriptionFocusNode?.dispose();
    textDoerDescriptionTextController?.dispose();

    textTaskStatusFocusNode?.dispose();
    textTaskStatusTextController?.dispose();

    textFieldFocusNode9?.dispose();
    textController12?.dispose();

    textFieldFocusNode10?.dispose();
    textController13?.dispose();

    textFieldFocusNode11?.dispose();
    textController14?.dispose();

    textFieldTransferDateFocusNode?.dispose();
    textFieldTransferDateTextController?.dispose();
  }
}
