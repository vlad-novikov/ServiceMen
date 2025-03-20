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
  // State field(s) for TextFieldContract widget.
  FocusNode? textFieldContractFocusNode;
  TextEditingController? textFieldContractTextController;
  String? Function(BuildContext, String?)?
      textFieldContractTextControllerValidator;
  // State field(s) for TextFieldId widget.
  FocusNode? textFieldIdFocusNode;
  TextEditingController? textFieldIdTextController;
  String? Function(BuildContext, String?)? textFieldIdTextControllerValidator;
  // State field(s) for TextFieldModel widget.
  FocusNode? textFieldModelFocusNode;
  TextEditingController? textFieldModelTextController;
  String? Function(BuildContext, String?)?
      textFieldModelTextControllerValidator;
  // State field(s) for TextFieldConnection widget.
  FocusNode? textFieldConnectionFocusNode;
  TextEditingController? textFieldConnectionTextController;
  String? Function(BuildContext, String?)?
      textFieldConnectionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextTaskStatus widget.
  FocusNode? textTaskStatusFocusNode;
  TextEditingController? textTaskStatusTextController;
  String? Function(BuildContext, String?)?
      textTaskStatusTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? statusName;
  // State field(s) for TextTaskTransfer widget.
  FocusNode? textTaskTransferFocusNode;
  TextEditingController? textTaskTransferTextController;
  String? Function(BuildContext, String?)?
      textTaskTransferTextControllerValidator;
  // State field(s) for TextDoer widget.
  FocusNode? textDoerFocusNode;
  TextEditingController? textDoerTextController;
  String? Function(BuildContext, String?)? textDoerTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? doerName;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextDoerDescription widget.
  FocusNode? textDoerDescriptionFocusNode;
  TextEditingController? textDoerDescriptionTextController;
  String? Function(BuildContext, String?)?
      textDoerDescriptionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextFieldTransferDate widget.
  FocusNode? textFieldTransferDateFocusNode;
  TextEditingController? textFieldTransferDateTextController;
  final textFieldTransferDateMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)?
      textFieldTransferDateTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;

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

    textFieldContractFocusNode?.dispose();
    textFieldContractTextController?.dispose();

    textFieldIdFocusNode?.dispose();
    textFieldIdTextController?.dispose();

    textFieldModelFocusNode?.dispose();
    textFieldModelTextController?.dispose();

    textFieldConnectionFocusNode?.dispose();
    textFieldConnectionTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();

    textFieldFocusNode5?.dispose();
    textController9?.dispose();

    textTaskStatusFocusNode?.dispose();
    textTaskStatusTextController?.dispose();

    textTaskTransferFocusNode?.dispose();
    textTaskTransferTextController?.dispose();

    textDoerFocusNode?.dispose();
    textDoerTextController?.dispose();

    textFieldFocusNode6?.dispose();
    textController13?.dispose();

    textDoerDescriptionFocusNode?.dispose();
    textDoerDescriptionTextController?.dispose();

    textFieldFocusNode7?.dispose();
    textController15?.dispose();

    textFieldTransferDateFocusNode?.dispose();
    textFieldTransferDateTextController?.dispose();

    textFieldFocusNode8?.dispose();
    textController17?.dispose();

    textFieldFocusNode9?.dispose();
    textController18?.dispose();

    textFieldFocusNode10?.dispose();
    textController19?.dispose();

    textFieldFocusNode11?.dispose();
    textController20?.dispose();
  }
}
