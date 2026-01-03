import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/flutter_flow/upload_data.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'edit_taches_model.dart';
export 'edit_taches_model.dart';

class EditTachesWidget extends StatefulWidget {
  const EditTachesWidget({
    super.key,
    this.infoTask,
  });

  static String routeName = 'EditTaches';
  static String routePath = '/editTaches';
  final TechnicianTaskStruct? infoTask;

  @override
  State<EditTachesWidget> createState() => _EditTachesWidgetState();
}

class _EditTachesWidgetState extends State<EditTachesWidget> {
  late EditTachesModel _model;
  bool _isButtonEnabled = true;
  DeviceStruct technicianDevices = DeviceStruct();
  List<GpsStruct> gpdDevicesPreTech = [];
  List<SimStruct> simDevicesPreTech = [];
  List<ClientStruct> newTaskInfo = [];
  List<CityStruct> clientCity = [];
  List<CategoryOfTaskStruct> taskCategory = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTachesModel());
    getDevicesByTechCall();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        _model.apiResponseTaskInfo = await TechnicienGroup.getNewTaskInfoCall.call();
        if ((_model.apiResponseTaskInfo?.succeeded ?? true)) {
          _model.newTaskInfo = NewTaskInfoStruct.maybeFromMap(
            _model.apiResponseTaskInfo?.jsonBody,
          );
          safeSetState(() {
            newTaskInfo = _model.newTaskInfo!.clients;
            clientCity = _model.newTaskInfo!.clientCity;
            taskCategory = _model.newTaskInfo!.typeTask;
          });
        }
      } catch (e) {
        print("error: $e");
      }
    });

    _model.textControllerClientName ??= TextEditingController(text: widget.infoTask?.clientName);
    _model.textFieldFocusNodeClientName ??= FocusNode();

    _model.textControllerMatricule ??= TextEditingController(text: widget.infoTask?.matricule);
    _model.textFieldFocusNodeMatricule ??= FocusNode();

    _model.dropDownValue ??= widget.infoTask?.catache;

    _model.textControllerIMEI ??= TextEditingController(text: (widget.infoTask?.IMEI).toString());
    _model.textFieldFocusNodeIMEI ??= FocusNode();
    _model.textControllerSIM ??= TextEditingController(text: (widget.infoTask?.SIM).toString());
    _model.textFieldFocusNodeSIM ??= FocusNode();

    _model.textControllerDeviceType ??= TextEditingController(text: widget.infoTask?.nameModeleGPS);
    _model.textFieldFocusNodeDeviceType ??= FocusNode();

    _model.textControllerDate ??= TextEditingController(text: dateTimeFormat("yyyy-MM-dd HH:mm:ss", widget.infoTask?.date_previsionnelle_debut));
    _model.textFieldFocusNodeDate ??= FocusNode();

    _model.textControllerDescription ??= TextEditingController(text: widget.infoTask?.observation);
    _model.textFieldFocusNodeDescription ??= FocusNode();
  }

  Future<DeviceStruct> getDevicesByTechCall() async {
    _model.apiResultGetDevicesByTech = await TechnicienGroup.appareilsCall.call();
    if ((_model.apiResultGetDevicesByTech?.succeeded ?? true)) {
      safeSetState(() {
        technicianDevices = DeviceStruct.maybeFromMap(_model.apiResultGetDevicesByTech?.jsonBody) as DeviceStruct;
        gpdDevicesPreTech = technicianDevices.gps;
        simDevicesPreTech = technicianDevices.sim;
      });
    }
    return technicianDevices;
  }

  void trackChange(String key, dynamic value) {
    setState(() {
      _model.toUpdate![key] = value;
    });
  }

  Future<dynamic> updateTaskSubmit() async {
    try{
      _model.apiResultUpdateTask = await TechnicienGroup.updateTaskTerminedCall.call(
      idTache: widget.infoTask?.id,
      toUpdate: _model.toUpdate,
    );
    if ((_model.apiResultUpdateTask?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tâche mise à jour avec succès',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          duration: Duration(milliseconds: 6000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Échec de la mise à jour de la tâche',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          duration: Duration(milliseconds: 6000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
    }
    catch(e){
      print("error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Opps! Une erreur est survenue.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
    return;
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
              'Modifier tâche',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.bold,
                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: MediaQuery.sizeOf(context).height * 0.98,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiResponseCompleter ??= Completer<ApiCallResponse>()..complete(TechnicienGroup.getNewTaskInfoCall.call())).future,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.95,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerClientName,
                                                  focusNode: _model.textFieldFocusNodeClientName,
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
                                                    hintText: 'Nom complet',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).alternate,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 16),
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: Color(0xFF57636C),
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                  validator: _model.textController1Validator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerMatricule,
                                                  focusNode: _model.textFieldFocusNodeMatricule,
                                                  onChanged: ((value) => trackChange('matricule', value)),
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
                                                    hintText: 'Matricule',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 16),
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
                                                  validator: _model.textController2Validator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                _model.dropDownValue,
                                              ),
                                              options: taskCategory.map((taskType) => taskType.taskName.toString()).toList(),
                                              onChanged: (value) {
                                                setState(() => _model.dropDownValue = value);
                                                trackChange('typeTache', value);
                                              },
                                              width: MediaQuery.of(context).size.width * 0.88,
                                              height: 50,
                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: Color(0xFF57636C),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                              hintText: 'Type de la tâche',
                                              icon: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                size: 24,
                                              ),
                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              elevation: 2,
                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                              borderWidth: 1,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 8.0, 0.0),
                                              child: Container(
                                                  width: 200.0,
                                                  child: Autocomplete<GpsStruct>(
                                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                                      if (textEditingValue.text == "") {
                                                        return List<GpsStruct>.empty();
                                                      }
                                                      return gpdDevicesPreTech.where((imei) => imei.serialNumber.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                                                    },
                                                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                                      return TextField(
                                                        controller: textEditingController,
                                                        focusNode: focusNode,
                                                        decoration: InputDecoration(
                                                          labelText: _model.textControllerIMEI.text == "null" ? "IMEI" : _model.textControllerIMEI.text,
                                                          border: OutlineInputBorder(),
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _model.textControllerIMEI.text = value;
                                                          });
                                                          trackChange('IMEI', value);
                                                        },
                                                      );
                                                    },
                                                    optionsViewBuilder: ((context, onselected, gpdDevicesPreTech) {
                                                      return Material(
                                                          child: ListView.builder(
                                                        itemCount: gpdDevicesPreTech.length,
                                                        itemBuilder: (context, index) {
                                                          final option = gpdDevicesPreTech.elementAt(index);
                                                          return ListTile(
                                                              title: Text(option.serialNumber),
                                                              onTap: () {
                                                                onselected(option);
                                                                setState(() {
                                                                  // serial_numberCombination = option.serialNumberCombination;
                                                                  _model.textControllerIMEI.text = option.serialNumber;
                                                                });
                                                              });
                                                        },
                                                      ));
                                                    }),
                                                    displayStringForOption: (gpsIMEI) => gpsIMEI.serialNumber,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerDeviceType,
                                                  focusNode: _model.textFieldFocusNodeDeviceType,
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
                                                    hintText: 'Type de l\'appareil',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 16),
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
                                                  validator: _model.textController4Validator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerSIM,
                                                  focusNode: _model.textFieldFocusNodeSIM,
                                                  onChanged: ((value) => trackChange('simNumber', value)),
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
                                                    hintText: 'SIM NUMBER',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 16),
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
                                                  validator: _model.textControllerSIMValidator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                              child: FlutterFlowDropDown<String>(
                                                controller: _model.gPSPositionValueController1 ??= FormFieldController<String>(
                                                  _model.gPSPositionValue1 ??= widget.infoTask?.gps_principale.toString(),
                                                ),
                                                options: List<String>.from([
                                                  '0',
                                                  '1',
                                                ]),
                                                optionLabels: ['principale(1er)', 'secondaire(2eme)'],
                                                onChanged: (val){
                                                  safeSetState(() => _model.gPSPositionValue1 = val);
                                                  trackChange('statut', val);
                                                },
                                                width: MediaQuery.of(context).size.width * 0.88,
                                                height: 50,
                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: Color(0xFF57636C),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                hintText: 'Gps principale / secondaire',
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  size: 24,
                                                ),
                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                elevation: 2,
                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                borderWidth: 1,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                              child: FlutterFlowDropDown<String>(
                                                controller: _model.typeRelaisValueController ??= FormFieldController<String>(
                                                  _model.typeRelaisValue ??= widget.infoTask?.accesoriesModel,
                                                ),
                                                options: List<String>.from([
                                                  'Normal',
                                                  'Spécial',
                                                ]),
                                                optionLabels: ['Normal', 'Spécial'],
                                                onChanged: (val){
                                                  safeSetState(() => _model.typeRelaisValue = val);
                                                  trackChange('typeRelais', val);
                                                },
                                                width: MediaQuery.sizeOf(context).width * 0.88,
                                                height: 50,
                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: Color(0xFF57636C),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                hintText: 'Normal/ Spéciale',
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  size: 24,
                                                ),
                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                elevation: 2,
                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                borderWidth: 1,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                              child: FlutterFlowDropDown<String>(
                                                controller: _model.cityValueController ??= FormFieldController<String>(
                                                  _model.cityValue ??= '',
                                                ),
                                                options: List<String>.from(['Option 1', 'Option 2', '2']),
                                                optionLabels: ['principale(1er)', 'GPS Position', 'secondaire(2eme)'],
                                                onChanged: (val){
                                                  safeSetState(() => _model.cityValue = val);
                                                  trackChange('madeAt', val);
                                                },
                                                width: MediaQuery.sizeOf(context).width * 0.88,
                                                height: 50,
                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: Color(0xFF57636C),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                hintText: 'Realisee a',
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  size: 24,
                                                ),
                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                elevation: 2,
                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                borderWidth: 1,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerDate,
                                                  focusNode: _model.textFieldFocusNodeDate,
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
                                                          color: Color(0xFF57636C),
                                                        ),
                                                    hintText: 'Date',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 16),
                                                    suffixIcon: Icon(
                                                      Icons.date_range_sharp,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: Color(0xFF57636C),
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                  keyboardType: TextInputType.datetime,
                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                  validator: _model.textController5Validator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia = await selectMedia(
                                              maxWidth: 960.00,
                                              maxHeight: 1280.00,
                                              imageQuality: 80,
                                              mediaSource: MediaSource.photoGallery,
                                              multiImage: true,
                                            );
                                            if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                              safeSetState(() => _model.isDataUploading= true);
                                              var selectedUploadedFiles = <FFUploadedFile>[];
                                              try {
                                                for (final media in selectedMedia) {
                                                  if (media.bytes == null) continue;
                                                  final compressed = await compressImageBytes(media.bytes);
                                                  selectedUploadedFiles.add(
                                                    FFUploadedFile(
                                                      bytes: compressed,
                                                      height: media.dimensions?.height,
                                                      width: media.dimensions?.width,
                                                      name: media.storagePath.split('/').last,
                                                      blurHash: media.blurHash,
                                                      originalFilename: media.originalFilename,
                                                    ),
                                                  );
                                                }
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles.length == selectedMedia.length) {
                                                final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                                safeSetState(() {
                                                  _model.uploadedLocalFiles = imagesJson;
                                                });
                                                trackChange('imagesTask', _model.uploadedLocalFiles);
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 315,
                                            height: 49.8,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.upload_file,
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    size: 32,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                    child: Text(
                                                      'Sélect fichiers',
                                                      textAlign: TextAlign.center,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 0),
                                              child: Container(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model.textControllerDescription,
                                                  focusNode: _model.textFieldFocusNodeDescription,
                                                  onChanged: (value) => trackChange('Description', value),
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
                                                    hintText: 'Description',
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
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme.of(context).error,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 20, 20, 16),
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: Color(0xFF57636C),
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                  maxLines: 2,
                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                  validator: _model.textController6Validator.asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 770,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _isButtonEnabled ? await updateTaskSubmit() : null;
                                    },
                                    text: 'Modifier la tâche',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ));
  }
}
