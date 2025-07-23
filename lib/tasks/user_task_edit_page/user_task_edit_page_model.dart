import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'user_task_edit_page_widget.dart' show UserTaskEditPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserTaskEditPageModel extends FlutterFlowModel<UserTaskEditPageWidget> {
  ///  Local state fields for this page.

  DateTime? pickedTransferDate;

  DateTime? finishDateTime;

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
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextFieldContract widget.
  FocusNode? textFieldContractFocusNode;
  TextEditingController? textFieldContractTextController;
  String? Function(BuildContext, String?)?
      textFieldContractTextControllerValidator;
  // State field(s) for TextFieldID widget.
  FocusNode? textFieldIDFocusNode;
  TextEditingController? textFieldIDTextController;
  String? Function(BuildContext, String?)? textFieldIDTextControllerValidator;
  // State field(s) for TextFieldModel widget.
  FocusNode? textFieldModelFocusNode;
  TextEditingController? textFieldModelTextController;
  String? Function(BuildContext, String?)?
      textFieldModelTextControllerValidator;
  // State field(s) for TextFieldID2 widget.
  FocusNode? textFieldID2FocusNode;
  TextEditingController? textFieldID2TextController;
  String? Function(BuildContext, String?)? textFieldID2TextControllerValidator;
  // State field(s) for TextFieldConnection widget.
  FocusNode? textFieldConnectionFocusNode;
  TextEditingController? textFieldConnectionTextController;
  String? Function(BuildContext, String?)?
      textFieldConnectionTextControllerValidator;
  // State field(s) for TextFieldTaskDescr widget.
  FocusNode? textFieldTaskDescrFocusNode;
  TextEditingController? textFieldTaskDescrTextController;
  String? Function(BuildContext, String?)?
      textFieldTaskDescrTextControllerValidator;
  // State field(s) for TextTaskCategory widget.
  FocusNode? textTaskCategoryFocusNode;
  TextEditingController? textTaskCategoryTextController;
  String? Function(BuildContext, String?)?
      textTaskCategoryTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
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
  // State field(s) for TextFinishTime widget.
  FocusNode? textFinishTimeFocusNode;
  TextEditingController? textFinishTimeTextController;
  String? Function(BuildContext, String?)?
      textFinishTimeTextControllerValidator;
  // State field(s) for TextDoer widget.
  FocusNode? textDoerFocusNode;
  TextEditingController? textDoerTextController;
  String? Function(BuildContext, String?)? textDoerTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? doerName;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for RadioDocOption widget.
  FormFieldController<String>? radioDocOptionValueController;
  // State field(s) for TextDoerDescription widget.
  FocusNode? textDoerDescriptionFocusNode;
  TextEditingController? textDoerDescriptionTextController;
  String? Function(BuildContext, String?)?
      textDoerDescriptionTextControllerValidator;
  // State field(s) for TextFieldTransferDescription widget.
  FocusNode? textFieldTransferDescriptionFocusNode;
  TextEditingController? textFieldTransferDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldTransferDescriptionTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButtonReason widget.
  String? reasonName;
  // State field(s) for TextFieldTransferDate widget.
  FocusNode? textFieldTransferDateFocusNode;
  TextEditingController? textFieldTransferDateTextController;
  late MaskTextInputFormatter textFieldTransferDateMask;
  String? Function(BuildContext, String?)?
      textFieldTransferDateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;

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

    textFieldIDFocusNode?.dispose();
    textFieldIDTextController?.dispose();

    textFieldModelFocusNode?.dispose();
    textFieldModelTextController?.dispose();

    textFieldID2FocusNode?.dispose();
    textFieldID2TextController?.dispose();

    textFieldConnectionFocusNode?.dispose();
    textFieldConnectionTextController?.dispose();

    textFieldTaskDescrFocusNode?.dispose();
    textFieldTaskDescrTextController?.dispose();

    textTaskCategoryFocusNode?.dispose();
    textTaskCategoryTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController11?.dispose();

    textTaskStatusFocusNode?.dispose();
    textTaskStatusTextController?.dispose();

    textTaskTransferFocusNode?.dispose();
    textTaskTransferTextController?.dispose();

    textFinishTimeFocusNode?.dispose();
    textFinishTimeTextController?.dispose();

    textDoerFocusNode?.dispose();
    textDoerTextController?.dispose();

    textDoerDescriptionFocusNode?.dispose();
    textDoerDescriptionTextController?.dispose();

    textFieldTransferDescriptionFocusNode?.dispose();
    textFieldTransferDescriptionTextController?.dispose();

    textFieldTransferDateFocusNode?.dispose();
    textFieldTransferDateTextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController19?.dispose();

    textFieldFocusNode6?.dispose();
    textController20?.dispose();

    textFieldFocusNode7?.dispose();
    textController21?.dispose();
  }

  /// Additional helper methods.
  String? get radioDocOptionValue => radioDocOptionValueController?.value;
}
