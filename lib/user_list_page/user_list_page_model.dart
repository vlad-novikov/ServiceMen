import '/backend/supabase/supabase.dart';
import '/components/side_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_page_widget.dart' show UserListPageWidget;
import 'package:flutter/material.dart';

class UserListPageModel extends FlutterFlowModel<UserListPageWidget> {
  ///  Local state fields for this page.

  DateTime? curDate;

  ///  State fields for stateful widgets in this page.

  // Model for SideNavigationComponent component.
  late SideNavigationComponentModel sideNavigationComponentModel;
  Stream<List<UsersRow>>? listViewSupabaseStream;
  // State field(s) for Checkbox widget.
  Map<UsersRow, bool> checkboxValueMap1 = {};
  List<UsersRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<UsersRow, bool> checkboxValueMap2 = {};
  List<UsersRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {
    sideNavigationComponentModel =
        createModel(context, () => SideNavigationComponentModel());
  }

  @override
  void dispose() {
    sideNavigationComponentModel.dispose();
  }
}
