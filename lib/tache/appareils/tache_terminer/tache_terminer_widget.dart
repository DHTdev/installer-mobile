import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mobile_installer/backend/schema/structs/device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/gps_struct.dart';
import 'package:mobile_installer/backend/schema/structs/installation_submit_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/flutter_flow/upload_data.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tache_terminer_model.dart';
export 'tache_terminer_model.dart';
import 'package:flutter/scheduler.dart';
import '/backend/api_requests/api_calls.dart';

class TacheTerminerWidget extends StatefulWidget {
  TacheTerminerWidget({super.key, this.infoTask});

  static String routeName = 'TacheTerminer';
  static String routePath = '/tacheTerminer';
  final TechnicianTaskStruct? infoTask;

  @override
  State<TacheTerminerWidget> createState() => _TacheTerminerWidgetState();
}

class _TacheTerminerWidgetState extends State<TacheTerminerWidget> {
  bool _isButtonEnabled = true;

  late TacheTerminerModel _model;
  DeviceStruct technicianDevices = DeviceStruct();
  List<GpsStruct> gpdDevicesPreTech = [];
  String? serial_numberCombination;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      getDevicesByTechCall();
    });
    _model = createModel(context, () => TacheTerminerModel());

    _model.textControllerMatricule ??= TextEditingController();
    _model.textFieldFocusNodeMatricule ??= FocusNode();

    _model.textControllerIMEI ??= TextEditingController();
    _model.textControllerIMEIFocus ??= FocusNode();

    _model.textControllerSimCombinat ??= TextEditingController();
    _model.textFieldFocusNodeSimCombinat ??= FocusNode();

    _model.textControllerDescription ??= TextEditingController();
    _model.textFieldFocusNodeDescription ??= FocusNode();
  }

  Future<Uint8List> compressImageBytes(Uint8List data) async {
    final compressed = await FlutterImageCompress.compressWithList(
      data,
      minHeight: 960,
      minWidth: 1280,
      quality: 80,
      format: CompressFormat.jpeg,
    );

    return Uint8List.fromList(compressed);
  }

  Future<List<Map<String, dynamic>>> prepareImagesForLaravel(
      List<FFUploadedFile> files) async {
    List<Map<String, dynamic>> out = [];

    for (var file in files) {
      if (file.bytes == null) continue;

      final compressed = await compressImageBytes(file.bytes!);
      final base64String = base64Encode(compressed);
      out.add({
        "data": base64String,
        "extension": "jpg",
      });
    }
    return out;
  }

  Future<void> sendTask() async {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
    final endInstallationTalsData = InstallationSubmitStruct(
      nomComplet: widget.infoTask?.clientName,
      matricule: _model.textControllerMatricule.text,
      imei: _model.textControllerIMEI.text,
      nsim: serial_numberCombination,
      observation: _model.textControllerDescription.text,
      GPSstatut: _model.dropDownValueGpsPosition,
      images: _model.uploadedLocalFiles_tacheInstallation,
      accessory: List.empty(),
      typeRelais: _model.dropDownValueTypeReley.toString(),
      etatTache: "2",
    );
    try {
      TechnicienGroup.updateTaskCall
          .call(widget.infoTask?.id, endInstallationTalsData, "installation");
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<DeviceStruct> getDevicesByTechCall() async {
    _model.apiResultGetDevicesByTech =
        await TechnicienGroup.appareilsCall.call();

    if ((_model.apiResultGetDevicesByTech?.succeeded ?? true)) {
      safeSetState(() {
        technicianDevices = DeviceStruct.maybeFromMap(
            _model.apiResultGetDevicesByTech?.jsonBody) as DeviceStruct;
        gpdDevicesPreTech = technicianDevices.gps;
      });
    }
    return technicianDevices;
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            widget.infoTask?.catache ?? '',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  fontSize: 20,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Container(
              width: 370.28,
              height: 695.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 12, 0, 0),
                                    child: Text(
                                      widget.infoTask?.clientName ?? '',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.85,
                              child: Divider(
                                height: 24,
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            FutureBuilder<ApiCallResponse>(
                                future: (_model.apiResponseCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(TechnicienGroup
                                              .appareilsCall
                                              .call()))
                                    .future,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 8, 8),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textControllerMatricule,
                                                  focusNode: _model
                                                      .textFieldFocusNodeMatricule,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText: 'Matricule',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 20, 20, 16),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.name,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textControllerMatriculeValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 8.0, 0.0),
                                              child: Container(
                                                  width: 200.0,
                                                  child:
                                                      Autocomplete<GpsStruct>(
                                                    optionsBuilder:
                                                        (TextEditingValue
                                                            textEditingValue) {
                                                      if (textEditingValue
                                                              .text ==
                                                          "") {
                                                        return List<
                                                            GpsStruct>.empty();
                                                      }
                                                      return gpdDevicesPreTech
                                                          .where((imei) => imei
                                                              .serialNumber
                                                              .toLowerCase()
                                                              .contains(
                                                                  textEditingValue
                                                                      .text
                                                                      .toLowerCase()));
                                                    },
                                                    fieldViewBuilder: (context,
                                                        textEditingController,
                                                        focusNode,
                                                        onFieldSubmitted) {
                                                      return TextField(
                                                        controller:
                                                            textEditingController,
                                                        focusNode: focusNode,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'IMEI',
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _model
                                                                .textControllerIMEI
                                                                .text = value;
                                                          });
                                                        },
                                                      );
                                                    },
                                                    optionsViewBuilder:
                                                        ((context, onselected,
                                                            gpdDevicesPreTech) {
                                                      return Material(
                                                          child:
                                                              ListView.builder(
                                                        itemCount:
                                                            gpdDevicesPreTech
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final option =
                                                              gpdDevicesPreTech
                                                                  .elementAt(
                                                                      index);
                                                          return ListTile(
                                                              title: Text(option
                                                                  .serialNumber),
                                                              onTap: () {
                                                                onselected(
                                                                    option);
                                                                setState(() {
                                                                  serial_numberCombination =
                                                                      option
                                                                          .serialNumberCombination;
                                                                  _model.textControllerIMEI
                                                                          .text =
                                                                      option
                                                                          .serialNumber;
                                                                });
                                                              });
                                                        },
                                                      ));
                                                    }),
                                                    displayStringForOption:
                                                        (gpsIMEI) => gpsIMEI
                                                            .serialNumber,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 8, 8),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: valueOrDefault(
                                                      TextEditingController(
                                                          text:
                                                              serial_numberCombination),
                                                      _model
                                                          .textControllerSimCombinat),
                                                  focusNode: _model
                                                      .textFieldFocusNodeSimCombinat,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText: 'N Sim',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 20, 20, 16),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  keyboardType:
                                                      const TextInputType
                                                          .numberWithOptions(
                                                          decimal: true),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textControllerSimCombinatValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 8),
                                            child: FlutterFlowDropDown<bool>(
                                              controller: _model
                                                      .dropDownValueControllerGpsPosition ??=
                                                  FormFieldController<bool>(
                                                _model.dropDownValueGpsPosition ??=
                                                    false,
                                              ),
                                              options: List<bool>.from([
                                                false,
                                                true,
                                              ]),
                                              optionLabels: [
                                                'principale(1er)',
                                                'secondaire(2eme)'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .dropDownValueGpsPosition =
                                                      val),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.88,
                                              height: 41.8,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF57636C),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              hintText:
                                                  'Gps principale / secondaire',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2,
                                              borderColor: Colors.black,
                                              borderWidth: 0,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 12, 0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 8),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueControllerTypeReley ??=
                                                  FormFieldController<String>(
                                                _model.dropDownValueTypeReley ??=
                                                    '',
                                              ),
                                              options: List<String>.from([
                                                'none',
                                                'normal',
                                                'spécial',
                                              ]),
                                              optionLabels: [
                                                'Sans Relais',
                                                'Normal',
                                                'Spécial'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .dropDownValueTypeReley =
                                                      val),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.88,
                                              height: 41.8,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF57636C),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: 'normal / spécial',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2,
                                              borderColor: Colors.black,
                                              borderWidth: 0,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 12, 0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              maxWidth: 960.00,
                                              maxHeight: 1280.00,
                                              imageQuality: 80,
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                      .isDataUploading_tacheInstallation =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              try {
                                                for (final media
                                                    in selectedMedia) {
                                                  if (media.bytes == null)
                                                    continue;
                                                  final compressed =
                                                      await compressImageBytes(
                                                          media.bytes);
                                                  selectedUploadedFiles.add(
                                                    FFUploadedFile(
                                                      bytes: compressed,
                                                      height: media
                                                          .dimensions?.height,
                                                      width: media
                                                          .dimensions?.width,
                                                      name: media.storagePath
                                                          .split('/')
                                                          .last,
                                                      blurHash: media.blurHash,
                                                      originalFilename: media
                                                          .originalFilename,
                                                    ),
                                                  );
                                                }
                                              } finally {
                                                _model.isDataUploading_tacheInstallation =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                final imagesJson =
                                                    await prepareImagesForLaravel(
                                                        selectedUploadedFiles);

                                                safeSetState(() {
                                                  _model.uploadedLocalFiles_tacheInstallation =
                                                      imagesJson;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 345.9,
                                            height: 49.8,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.upload_file,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 32,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 0, 0),
                                                    child: Text(
                                                      'Sélect fichiers',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textControllerDescription,
                                                  focusNode: _model
                                                      .textFieldFocusNodeDescription,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText: 'Observation',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 20, 20, 16),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  maxLines: 4,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textControllerDescriptionValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 12),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _isButtonEnabled
                                                ? await sendTask()
                                                : null;
                                          },
                                          text: 'Terminer tâche',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 24, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: Color(0xFF07C491),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 3,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 770,
                      ),
                      decoration: BoxDecoration(),
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
