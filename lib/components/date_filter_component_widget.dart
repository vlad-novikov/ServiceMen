import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'date_filter_component_model.dart';
export 'date_filter_component_model.dart';

class DateFilterComponentWidget extends StatefulWidget {
  const DateFilterComponentWidget({
    super.key,
    this.parameter1,
  });

  final DateTime? parameter1;

  @override
  State<DateFilterComponentWidget> createState() =>
      _DateFilterComponentWidgetState();
}

class _DateFilterComponentWidgetState extends State<DateFilterComponentWidget> {
  late DateFilterComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateFilterComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            'gvzroegk' /* На дату:  */,
          ),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              FFAppState().AppCurrDate =
                  functions.dateMinusDay(FFAppState().AppCurrDate!);
              FFAppState().AppCurDateStr = dateTimeFormat(
                "yyyy-MM-dd",
                FFAppState().AppCurrDate,
                locale: FFLocalizations.of(context).languageCode,
              );
              safeSetState(() {});

              _model.updatePage(() {});
            },
          ),
        ),
        Text(
          valueOrDefault<String>(
            dateTimeFormat(
              "dd-MMM-yyyy",
              FFAppState().AppCurrDate,
              locale: FFLocalizations.of(context).languageCode,
            ),
            'CurDate()',
          ),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              ),
        ),
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.calendar_month,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            final _datePickedDate = await showDatePicker(
              context: context,
              initialDate: getCurrentTimestamp,
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
              builder: (context, child) {
                return wrapInMaterialDatePickerTheme(
                  context,
                  child!,
                  headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                  headerForegroundColor: FlutterFlowTheme.of(context).info,
                  headerTextStyle:
                      FlutterFlowTheme.of(context).headlineLarge.override(
                            fontFamily: 'Inter Tight',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                  pickerBackgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  pickerForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  selectedDateTimeBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  selectedDateTimeForegroundColor:
                      FlutterFlowTheme.of(context).info,
                  actionButtonForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  iconSize: 24.0,
                );
              },
            );

            if (_datePickedDate != null) {
              safeSetState(() {
                _model.datePicked = DateTime(
                  _datePickedDate.year,
                  _datePickedDate.month,
                  _datePickedDate.day,
                );
              });
            } else if (_model.datePicked != null) {
              safeSetState(() {
                _model.datePicked = getCurrentTimestamp;
              });
            }
            FFAppState().AppCurrDate = _model.datePicked;
            FFAppState().AppCurDateStr = dateTimeFormat(
              "yyyy-MM-dd",
              _model.datePicked,
              locale: FFLocalizations.of(context).languageCode,
            );
            safeSetState(() {});

            safeSetState(() {});
          },
        ),
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.arrow_circle_right_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            FFAppState().AppCurrDate =
                functions.datePlusDay(FFAppState().AppCurrDate!);
            FFAppState().AppCurDateStr = dateTimeFormat(
              "yyyy-MM-dd",
              FFAppState().AppCurrDate,
              locale: FFLocalizations.of(context).languageCode,
            );
            safeSetState(() {});

            _model.updatePage(() {});
          },
        ),
        Opacity(
          opacity: 0.1,
          child: Text(
            FFAppState().AppCurDateStr,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
