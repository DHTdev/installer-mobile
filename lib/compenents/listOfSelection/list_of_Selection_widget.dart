import 'dart:async';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'list_of_selection_model.dart';
export 'list_of_selection_model.dart';

class ListOfSelectionWidget extends StatefulWidget {
  ListOfSelectionWidget({
    super.key,
    this.onItemSelected,
  });

  final Function? onItemSelected;
  @override
  State<ListOfSelectionWidget> createState() => _ListOfSelectionWidgetState();
}

class _ListOfSelectionWidgetState extends State<ListOfSelectionWidget> {
  late ListOfSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfSelectionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultupj = await TechnicienGroup.appareilsCall.call();

      if ((_model.apiResultupj?.succeeded ?? true)) {
        _model.sims = DeviceStruct.maybeFromMap((_model.apiResultupj?.jsonBody ?? ''))!.sim.toList().cast<SimStruct>();
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  void shearchSim() {
    final query = _model.textController?.text.toLowerCase() ?? '';
    final allSims = DeviceStruct.maybeFromMap((_model.apiResultupj?.jsonBody ?? ''))!.sim.toList().cast<SimStruct>();

    if (query.isEmpty) {
      _model.sims = allSims;
    } else {
      _model.sims = allSims.where((sim) {
        final serialNumber = sim.serialNumber.toLowerCase();
        final imei = sim.latestDeviceRelating.isNotEmpty ? sim.latestDeviceRelating.first.serialNumber.toLowerCase() : '';
        return serialNumber.contains(query) || imei.contains(query);
      }).toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(
                      0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Text(
                            'Selectionnez un element',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                  ),
                                  color: Color(0xFF14181B),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.cancel,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                      ].divide(SizedBox(width: 15)).addToStart(SizedBox(width: 5)).addToEnd(SizedBox(width: 5)),
                    ),
                    TextFormField(
                      onChanged: (_) => shearchSim(),
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Rechercher...',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                              ),
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                              ),
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: Color(0xFF14181B),
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                      validator: _model.textControllerValidator.asValidator(context),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE0E3E7),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiResponseCompleter ??= Completer<ApiCallResponse>()..complete(TechnicienGroup.appareilsCall.call())).future,
                        builder: (context, snapshot) {
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
                          final sims = _model.sims.map((e) => e.serialNumber).toList();

                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: sims.length,
                              itemBuilder: (context, imeisIndex) {
                                final simItem = sims[imeisIndex];
                                final relatingDevice = _model.sims.firstWhere((e) => e.serialNumber == simItem).latestDeviceRelating.isNotEmpty
                                    ? _model.sims.firstWhere((e) => e.serialNumber == simItem).latestDeviceRelating.first
                                    : null;
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 8),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onItemSelected?.call(simItem);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Text(
                                        "${simItem}/ ${relatingDevice != null ? relatingDevice.serialNumber : 'No Device'}",
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
