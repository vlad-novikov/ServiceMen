import '/components/date_filter_component_widget.dart';
import '/components/side_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reports_page_widget.dart' show ReportsPageWidget;
import 'package:flutter/material.dart';

class ReportsPageModel extends FlutterFlowModel<ReportsPageWidget> {
  ///  Local state fields for this page.

  DateTime? filterDate;

  DateTime? pageDate;

  ///  State fields for stateful widgets in this page.

  // Model for SideNavigationComponent component.
  late SideNavigationComponentModel sideNavigationComponentModel;
  // Model for DateFilterComponent component.
  late DateFilterComponentModel dateFilterComponentModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    sideNavigationComponentModel =
        createModel(context, () => SideNavigationComponentModel());
    dateFilterComponentModel =
        createModel(context, () => DateFilterComponentModel());
  }

  @override
  void dispose() {
    sideNavigationComponentModel.dispose();
    dateFilterComponentModel.dispose();
  }
}
