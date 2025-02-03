import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_page_widget.dart' show UserListPageWidget;
import 'package:flutter/material.dart';

class UserListPageModel extends FlutterFlowModel<UserListPageWidget> {
  ///  Local state fields for this page.

  DateTime? curDate;

  ///  State fields for stateful widgets in this page.

  Stream<List<UsersRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
