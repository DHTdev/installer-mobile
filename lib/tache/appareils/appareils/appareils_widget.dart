import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_section_widget.dart';
import '/components/number_device_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'appareils_model.dart';
export 'appareils_model.dart';

class AppareilsWidget extends StatefulWidget {
  const AppareilsWidget({
    super.key,
    this.technicianDevices,
  });

  final DeviceStruct? technicianDevices;

  static String routeName = 'Appareils';
  static String routePath = '/appareils';

  @override
  State<AppareilsWidget> createState() => _AppareilsWidgetState();
}

class _AppareilsWidgetState extends State<AppareilsWidget> {
  late AppareilsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppareilsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwi6 = await TechnicienGroup.appareilsCall.call();

      if ((_model.apiResultwi6?.succeeded ?? true)) {
        _model.technicianDevices =
            DeviceStruct.maybeFromMap((_model.apiResultwi6?.jsonBody ?? ''));
        safeSetState(() {});
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEAEDF7),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.headerSectionModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderSectionWidget(),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        GpsWidget.routeName,
                        queryParameters: {
                          'imei': serializeParam(
                            '',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: wrapWithModel(
                      model: _model.numberDeviceModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: NumberDeviceWidget(
                        typeName: 'GPS',
                        numberDevices: widget.technicianDevices!.numberGps,
                        gps: widget.technicianDevices?.gps,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(SimWidget.routeName);
                    },
                    child: wrapWithModel(
                      model: _model.numberDeviceModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: NumberDeviceWidget(
                        typeName: 'SIM',
                        numberDevices: widget.technicianDevices!.numberSim,
                        sim: widget.technicianDevices?.sim,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AccessoiresWidget.routeName);
                    },
                    child: wrapWithModel(
                      model: _model.numberDeviceModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: NumberDeviceWidget(
                        typeName: 'Accessory',
                        numberDevices:
                            widget.technicianDevices!.numberAccessory,
                        accessory: widget.technicianDevices?.accessory,
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 15.0)).around(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
