import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'docs_in_t_s_p_component_widget.dart' show DocsInTSPComponentWidget;
import 'package:flutter/material.dart';

class DocsInTSPComponentModel
    extends FlutterFlowModel<DocsInTSPComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioDocOption widget.
  FormFieldController<String>? radioDocOptionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioDocOptionValue => radioDocOptionValueController?.value;
}
