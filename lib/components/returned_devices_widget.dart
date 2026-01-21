import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'returned_devices_model.dart';
export 'returned_devices_model.dart';

class ReturnedDevicesWidget extends StatefulWidget {
  const ReturnedDevicesWidget({
    super.key,
    this.imei,
    this.nameModele,
    this.nomComplet,
    this.matricule,
    this.dateReturned,
    // required this.selected,
    this.onSelectedChanged,
    this.id,
  });

  final String? imei;
  final String? nameModele;
  final String? nomComplet;
  final String? matricule;
  final String? dateReturned;
  // final bool selected;
  final Future Function(int id, bool value)? onSelectedChanged;
  final int? id;

  @override
  State<ReturnedDevicesWidget> createState() => _ReturnedDevicesWidgetState();
}

class _ReturnedDevicesWidgetState extends State<ReturnedDevicesWidget> {
  late ReturnedDevicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReturnedDevicesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
        child: Container(
          height: 157.54,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.nomComplet,
                              '------------',
                            ),
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                  ),
                                  color: Color(0xFF15284C),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.matricule,
                              '------------',
                            ),
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                  ),
                                  color: Color(0xFF414141),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.imei,
                              '------------',
                            ),
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                  ),
                                  color: Color(0xFF848A8F),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_sharp,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 14.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.nameModele,
                                        '------------',
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)).around(SizedBox(width: 6.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 14.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.dateReturned,
                                        '------------',
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)).around(SizedBox(width: 6.0)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.checkboxValue = newValue!);
                                      if (newValue!) {
                                        await widget.onSelectedChanged?.call(
                                          widget.id!,
                                          true,
                                        );
                                      } else {
                                        await widget.onSelectedChanged?.call(
                                          widget.id!,
                                          false,
                                        );
                                      }
                                    },
                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context).alternate,
                                          )
                                        : null,
                                    activeColor: FlutterFlowTheme.of(context).secondary,
                                    checkColor: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
