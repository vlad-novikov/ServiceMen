import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'docs_in_t_s_p_component_model.dart';
export 'docs_in_t_s_p_component_model.dart';

class DocsInTSPComponentWidget extends StatefulWidget {
  const DocsInTSPComponentWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<DocsInTSPComponentWidget> createState() =>
      _DocsInTSPComponentWidgetState();
}

class _DocsInTSPComponentWidgetState extends State<DocsInTSPComponentWidget> {
  late DocsInTSPComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocsInTSPComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'qq2b8f0j' /* Документы в ТСП */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              FlutterFlowRadioButton(
                options: [
                  FFLocalizations.of(context).getText(
                    '9g3gw4r8' /* Да */,
                  ),
                  FFLocalizations.of(context).getText(
                    'rwqer1jf' /* Нет */,
                  )
                ].toList(),
                onChanged: (val) => safeSetState(() {}),
                controller: _model.radioDocOptionValueController ??=
                    FormFieldController<String>(widget.parameter1!),
                optionHeight: 32.0,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                selectedTextStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                buttonPosition: RadioButtonPosition.left,
                direction: Axis.horizontal,
                radioButtonColor: FlutterFlowTheme.of(context).primary,
                inactiveRadioButtonColor:
                    FlutterFlowTheme.of(context).secondaryText,
                toggleable: true,
                horizontalAlignment: WrapAlignment.start,
                verticalAlignment: WrapCrossAlignment.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
