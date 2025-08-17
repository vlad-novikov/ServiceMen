import '/components/docs_in_t_s_p_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_task_edit_page_widget.dart' show UserTaskEditPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserTaskEditPageModel extends FlutterFlowModel<UserTaskEditPageWidget> {
  ///  Local state fields for this page.

  DateTime? transferDateTime;

  DateTime? finishDateTime;

  bool changedDoerComment = false;

  bool changedInternalComment = false;

  bool changedOutingComment = false;

  bool changedParkingComment = false;

  bool changedTransferComment = false;

  bool changedTransferReason = false;

  bool changedTransferDate = false;

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
  // Model for DocsInTSPComponent component.
  late DocsInTSPComponentModel docsInTSPComponentModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
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
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButtonInternal widget.
  String? alertOutput;
  // State field(s) for TextOutingComment widget.
  FocusNode? textOutingCommentFocusNode;
  TextEditingController? textOutingCommentTextController;
  String? Function(BuildContext, String?)?
      textOutingCommentTextControllerValidator;
  // State field(s) for TextParkingComment widget.
  FocusNode? textParkingCommentFocusNode;
  TextEditingController? textParkingCommentTextController;
  String? Function(BuildContext, String?)?
      textParkingCommentTextControllerValidator;
  // State field(s) for TextFieldTransferReason widget.
  FocusNode? textFieldTransferReasonFocusNode;
  TextEditingController? textFieldTransferReasonTextController;
  String? Function(BuildContext, String?)?
      textFieldTransferReasonTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButtonReason widget.
  String? reasonName;
  // State field(s) for TextTransferDate widget.
  FocusNode? textTransferDateFocusNode;
  TextEditingController? textTransferDateTextController;
  late MaskTextInputFormatter textTransferDateMask;
  String? Function(BuildContext, String?)?
      textTransferDateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextTransferPhone widget.
  FocusNode? textTransferPhoneFocusNode1;
  TextEditingController? textTransferPhoneTextController1;
  String? Function(BuildContext, String?)?
      textTransferPhoneTextController1Validator;
  // State field(s) for TextTransferPhone widget.
  FocusNode? textTransferPhoneFocusNode2;
  TextEditingController? textTransferPhoneTextController2;
  String? Function(BuildContext, String?)?
      textTransferPhoneTextController2Validator;

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

    docsInTSPComponentModel.dispose();
    textDoerDescriptionFocusNode?.dispose();
    textDoerDescriptionTextController?.dispose();

    textInternalCommentFocusNode?.dispose();
    textInternalCommentTextController?.dispose();

    textOutingCommentFocusNode?.dispose();
    textOutingCommentTextController?.dispose();

    textParkingCommentFocusNode?.dispose();
    textParkingCommentTextController?.dispose();

    textFieldTransferReasonFocusNode?.dispose();
    textFieldTransferReasonTextController?.dispose();

    textTransferDateFocusNode?.dispose();
    textTransferDateTextController?.dispose();

    textTransferPhoneFocusNode1?.dispose();
    textTransferPhoneTextController1?.dispose();

    textTransferPhoneFocusNode2?.dispose();
    textTransferPhoneTextController2?.dispose();
  }
}
