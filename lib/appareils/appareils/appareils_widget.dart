
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compenents/appareils/number_device_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appareils_model.dart';
export 'appareils_model.dart';

class AppareilsWidget extends StatefulWidget {
  const AppareilsWidget({
    super.key,
  });

  static String routeName = 'Appareils';
  static String routePath = '/appareils';

  @override
  State<AppareilsWidget> createState() => _AppareilsWidgetState();
}

class _AppareilsWidgetState extends State<AppareilsWidget> {
  late AppareilsModel _model;
  DeviceStruct technicianDevices = DeviceStruct();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppareilsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwi6 = await TechnicienGroup.appareilsCall.call();

      if ((_model.apiResultwi6?.succeeded ?? true)) {
        print(DeviceStruct.maybeFromMap(_model.apiResultwi6?.jsonBody).runtimeType);
        // _model.technicianDevices =DeviceStruct.maybeFromMap(_model.apiResultwi6?.jsonBody) as Map<String, dynamic>;

        safeSetState(() {
          technicianDevices = DeviceStruct.maybeFromMap(_model.apiResultwi6?.jsonBody) as DeviceStruct;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("technicianDevices:${technicianDevices.numberGps}");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEAEDF7),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bonjour Hamza TOUIL',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '21:51 Fri Jul 04 2025',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0,
                                        2,
                                      ),
                                      spreadRadius: 2,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.notifications_active,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                              ),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0,
                                        2,
                                      ),
                                      spreadRadius: 2,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.exit_to_app_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                              ),
                            ].divide(SizedBox(width: 15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: wrapWithModel(
                    model: _model.numberDeviceModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: NumberDeviceWidget(
                      typeName: 'GPS',
                      numberDevices: technicianDevices.numberGps.toString(),
                      gps: technicianDevices.gps,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: wrapWithModel(
                    model: _model.numberDeviceModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: NumberDeviceWidget(
                      typeName: 'SIM',
                      numberDevices: technicianDevices.numberSim.toString(),
                      sim: technicianDevices.sim,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: wrapWithModel(
                    model: _model.numberDeviceModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: NumberDeviceWidget(
                      typeName: 'Accessory',
                      numberDevices: technicianDevices.numberAccessory.toString(),
                      accessory: technicianDevices.accessory,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 15)).around(SizedBox(height: 15)),
            ),
          ),
        ),
      ),
    );
  }
}
