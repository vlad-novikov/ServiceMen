import '/components/docs_in_t_s_p_component_widget.dart';
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
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextFieldContract widget.
  FocusNode? textFieldContractFocusNode;
  TextEditingController? textFieldContractTextController;
  String? Function(BuildContext, String?)?
      textFieldContractTextControllerValidator;
  // State field(s) for TextEquipmentID1 widget.
  FocusNode? textEquipmentID1FocusNode;
  TextEditingController? textEquipmentID1TextController;
  String? Function(BuildContext, String?)?
      textEquipmentID1TextControllerValidator;
  // State field(s) for TextModel widget.
  FocusNode? textModelFocusNode;
  TextEditingController? textModelTextController;
  String? Function(BuildContext, String?)? textModelTextControllerValidator;
  // State field(s) for TextEquipmentID2 widget.
  FocusNode? textEquipmentID2FocusNode;
  TextEditingController? textEquipmentID2TextController;
  String? Function(BuildContext, String?)?
      textEquipmentID2TextControllerValidator;
  // State field(s) for TextFieldConnection widget.
  FocusNode? textFieldConnectionFocusNode;
  TextEditingController? textFieldConnectionTextController;
  String? Function(BuildContext, String?)?
      textFieldConnectionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextTaskStatus widget.
  FocusNode? textTaskStatusFocusNode;
  TextEditingController? textTaskStatusTextController;
  String? Function(BuildContext, String?)?
      textTaskStatusTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? statusName;
  // State field(s) for TextFinishTime widget.
  FocusNode? textFinishTimeFocusNode;
  TextEditingController? textFinishTimeTextController;
  String? Function(BuildContext, String?)?
      textFinishTimeTextControllerValidator;
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
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Model for DocsInTSPComponent component.
  late DocsInTSPComponentModel docsInTSPComponentModel;
  // State field(s) for TextDoerDescription widget.
  FocusNode? textDoerDescriptionFocusNode;
  TextEditingController? textDoerDescriptionTextController;
  String? Function(BuildContext, String?)?
      textDoerDescriptionTextControllerValidator;
  // State field(s) for TextInternalComment widget.
  FocusNode? textInternalCommentFocusNode;
  TextEditingController? textInternalCommentTextController;
  String? Function(BuildContext, String?)?
      textInternalCommentTextControllerValidator;
  // State field(s) for TextOutingComment widget.
  FocusNode? textOutingCommentFocusNode;
  TextEditingController? textOutingCommentTextController;
  String? Function(BuildContext, String?)?
      textOutingCommentTextControllerValidator;
  // State field(s) for TextFieldParkingComment widget.
  FocusNode? textFieldParkingCommentFocusNode;
  TextEditingController? textFieldParkingCommentTextController;
  String? Function(BuildContext, String?)?
      textFieldParkingCommentTextControllerValidator;
  // State field(s) for TexttTransferReason widget.
  FocusNode? texttTransferReasonFocusNode;
  TextEditingController? texttTransferReasonTextController;
  String? Function(BuildContext, String?)?
      texttTransferReasonTextControllerValidator;
  // State field(s) for TextFieldTransferDate widget.
  FocusNode? textFieldTransferDateFocusNode;
  TextEditingController? textFieldTransferDateTextController;
  late MaskTextInputFormatter textFieldTransferDateMask;
  String? Function(BuildContext, String?)?
      textFieldTransferDateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextTransferPeson widget.
  FocusNode? textTransferPesonFocusNode;
  TextEditingController? textTransferPesonTextController;
  String? Function(BuildContext, String?)?
      textTransferPesonTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController23;
  String? Function(BuildContext, String?)? textController23Validator;
  // State field(s) for TextTransferComment widget.
  FocusNode? textTransferCommentFocusNode;
  TextEditingController? textTransferCommentTextController;
  String? Function(BuildContext, String?)?
      textTransferCommentTextControllerValidator;

  @override
  void initState(BuildContext context) {
    docsInTSPComponentModel =
        createModel(context, () => DocsInTSPComponentModel());
  }

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

    textEquipmentID1FocusNode?.dispose();
    textEquipmentID1TextController?.dispose();

    textModelFocusNode?.dispose();
    textModelTextController?.dispose();

    textEquipmentID2FocusNode?.dispose();
    textEquipmentID2TextController?.dispose();

    textFieldConnectionFocusNode?.dispose();
    textFieldConnectionTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController9?.dispose();

    textFieldFocusNode5?.dispose();
    textController10?.dispose();

    textFieldFocusNode6?.dispose();
    textController11?.dispose();

    textTaskStatusFocusNode?.dispose();
    textTaskStatusTextController?.dispose();

    textFinishTimeFocusNode?.dispose();
    textFinishTimeTextController?.dispose();

    textTaskTransferFocusNode?.dispose();
    textTaskTransferTextController?.dispose();

    textDoerFocusNode?.dispose();
    textDoerTextController?.dispose();

    docsInTSPComponentModel.dispose();
    textDoerDescriptionFocusNode?.dispose();
    textDoerDescriptionTextController?.dispose();

    textInternalCommentFocusNode?.dispose();
    textInternalCommentTextController?.dispose();

    textOutingCommentFocusNode?.dispose();
    textOutingCommentTextController?.dispose();

    textFieldParkingCommentFocusNode?.dispose();
    textFieldParkingCommentTextController?.dispose();

    texttTransferReasonFocusNode?.dispose();
    texttTransferReasonTextController?.dispose();

    textFieldTransferDateFocusNode?.dispose();
    textFieldTransferDateTextController?.dispose();

    textTransferPesonFocusNode?.dispose();
    textTransferPesonTextController?.dispose();

    textFieldFocusNode7?.dispose();
    textController23?.dispose();

    textTransferCommentFocusNode?.dispose();
    textTransferCommentTextController?.dispose();
  }
}
