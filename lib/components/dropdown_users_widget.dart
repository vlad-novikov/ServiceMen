import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'dropdown_users_model.dart';
export 'dropdown_users_model.dart';

class DropdownUsersWidget extends StatefulWidget {
  const DropdownUsersWidget({
    super.key,
    this.userName,
  });

  final String? userName;

  @override
  State<DropdownUsersWidget> createState() => _DropdownUsersWidgetState();
}

class _DropdownUsersWidgetState extends State<DropdownUsersWidget> {
  late DropdownUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownUsersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().queryRows(
        queryFn: (q) => q.order('last_name', ascending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<UsersRow> dropDownUsersRowList = snapshot.data!;

        return FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= widget.userName,
          ),
          options:
              dropDownUsersRowList.map((e) => e.lastName).withoutNulls.toList(),
          onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
          width: 200.0,
          height: 40.0,
          searchHintTextStyle:
              FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintText: 'Исполнитель',
          searchHintText: 'Search...',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          borderRadius: 8.0,
          margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          hidesUnderline: true,
          isOverButton: false,
          isSearchable: true,
          isMultiSelect: false,
        );
      },
    );
  }
}
