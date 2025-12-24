
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'number_device_model.dart';
export 'number_device_model.dart';

class NumberDeviceWidget extends StatefulWidget {
  const NumberDeviceWidget({
    super.key,
    required this.typeName,
    required this.numberDevices,
    this.gps,
    this.sim,
    this.accessory,
  });

  final String typeName;
  final String? numberDevices;
  final List<GpsStruct>? gps;
  final List<SimStruct>? sim;
  final List<AccessoryStruct>? accessory;

  @override
  State<NumberDeviceWidget> createState() => _NumberDeviceWidgetState();
}

class _NumberDeviceWidgetState extends State<NumberDeviceWidget> {
  late NumberDeviceModel _model;
  String? path;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumberDeviceModel());
  }

  Future setPath(String? value) async {
    switch (value) {
      case 'GPS':
      setState(() {
          FFAppState().devicesGps = widget.gps!;
        });
        path = GpsWidget.routeName;
        break;
      case 'SIM':
        setState(() {
          FFAppState().devicesSim = widget.sim!;
        });
        path = SimWidget.routeName;
        break;
      case 'Accessoires':
        setState(() {
          FFAppState().devicesAccessory = widget.accessory!;
        });
        path = AccessoiresWidget.routeName;
        break;
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await setPath(widget.typeName);
          if (path != null) {
            await context.pushNamed(path!);
          }
        },
        child: Container(
          width: 369.8,
          height: 80.4,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  5.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.typeName,
                      'device type',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.black,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.numberDevices,
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFF1CC88A),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
