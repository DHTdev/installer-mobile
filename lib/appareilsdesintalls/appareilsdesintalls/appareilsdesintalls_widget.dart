import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_section_widget.dart';
import '/components/returned_devices_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'appareilsdesintalls_model.dart';
export 'appareilsdesintalls_model.dart';

class AppareilsdesintallsWidget extends StatefulWidget {
  const AppareilsdesintallsWidget({super.key});

  static String routeName = 'Appareilsdesintalls';
  static String routePath = '/appareilsdesintalls';

  @override
  State<AppareilsdesintallsWidget> createState() => _AppareilsdesintallsWidgetState();
}

class _AppareilsdesintallsWidgetState extends State<AppareilsdesintallsWidget> {
  late AppareilsdesintallsModel _model;
  bool _isButtonEnabled = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppareilsdesintallsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultz7r = await TechnicienGroup.returnedDevicesCall.call();

      if ((_model.apiResultz7r?.succeeded ?? true)) {
        _model.returnedDevices = ((_model.apiResultz7r?.jsonBody ?? '').toList().map<ReturnedDevicesStruct?>(ReturnedDevicesStruct.maybeFromMap).toList() as Iterable<ReturnedDevicesStruct?>)
            .withoutNulls
            .toList()
            .cast<ReturnedDevicesStruct>();
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  Future<void> returnDevicesToST() async {
    setState(() {
      _isButtonEnabled = false;
    });
    _model.apiResultaf3 = await TechnicienGroup.affectedDevicesCall.call(
      articlesList: _model.selectedDevices,
    );
    if ((_model.apiResultaf3?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Appareils retournés avec succès à ST',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).info,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Échec du retour des appareils. Veuillez réessayer.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).info,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }

    safeSetState(() {});
    setState(() {
      _isButtonEnabled = true;
      _model.returnedDevices.removeWhere((item) => _model.selectedDevices.contains(item.id));
    });
  }

  void searchDevice() {
    () {
      final query = _model.textController?.text.toLowerCase() ?? '';
      final allDevices = ((_model.apiResultz7r?.jsonBody ?? '').toList().map<ReturnedDevicesStruct?>(ReturnedDevicesStruct.maybeFromMap).toList() as Iterable<ReturnedDevicesStruct?>)
          .withoutNulls
          .toList()
          .cast<ReturnedDevicesStruct>();
      if (query.isEmpty) {
        _model.returnedDevices = allDevices;
      } else {
        _model.returnedDevices = allDevices.where((device) {
          final serialNumber = device.serialNumber.toLowerCase();
          final imei = device.matricule.toLowerCase();
          final client = device.nomComplet.toLowerCase();
          return serialNumber.contains(query) || imei.contains(query) || client.contains(query);
        }).toList();
      }
      setState(() {});
    };
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: 342.2,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) async {
                              searchDevice();
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                  ),
                              hintText: 'Rechercher...',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x4C000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator.asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'GPS retournées   | ',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            ' ${_model.returnedDevices.length}  appareils',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 15.0)).around(SizedBox(width: 15.0)),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.71,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Builder(
                            builder: (context) {
                              final returnedDevicesList = _model.returnedDevices.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: returnedDevicesList.length,
                                itemBuilder: (context, returnedDevicesListIndex) {
                                  final returnedDevicesListItem = returnedDevicesList[returnedDevicesListIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                      child: wrapWithModel(
                                        model: _model.returnedDevicesModels.getModel(
                                          returnedDevicesListItem.id.toString(),
                                          returnedDevicesListIndex,
                                        ),
                                        updateCallback: () => safeSetState(() {}),
                                        child: ReturnedDevicesWidget(
                                          key: Key(
                                            'Keyk4h_${returnedDevicesListItem.id.toString()}',
                                          ),
                                          imei: returnedDevicesListItem.serialNumber,
                                          nameModele: returnedDevicesListItem.nameModele,
                                          nomComplet: returnedDevicesListItem.nomComplet,
                                          matricule: returnedDevicesListItem.matricule,
                                          dateReturned: returnedDevicesListItem.dataReturned,
                                          selected: _model.selected,
                                          id: returnedDevicesListItem.id,
                                          onSelectedChanged: (id, value) async {
                                            if (value == true) {
                                              _model.addToSelectedDevices(returnedDevicesListItem.id);
                                              _model.selected = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.removeFromSelectedDevices(returnedDevicesListItem.id);
                                              _model.selected = false;
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.65),
                        child: Container(
                          width: 392.7,
                          height: 65.2,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-0.11, 0.45),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _isButtonEnabled ? await returnDevicesToST() : null;
                              },
                              text: 'Retourner  à ST',
                              options: FFButtonOptions(
                                width: 159.1,
                                height: 35.5,
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
