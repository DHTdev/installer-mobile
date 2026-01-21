import 'dart:async';

import 'package:mobile_installer/backend/schema/structs/car_struct.dart';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/panne_relais_submit_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/tache/taches/taches_provider.dart';
import 'package:provider/provider.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'panne_relais_model.dart';
export 'panne_relais_model.dart';

class PanneRelaisWidget extends StatefulWidget {
  const PanneRelaisWidget({
    super.key,
    required this.infoTask,
  });

  final TechnicianTaskStruct? infoTask;

  static String routeName = 'PanneRelais';
  static String routePath = '/panneRelais';

  @override
  State<PanneRelaisWidget> createState() => _PanneRelaisWidgetState();
}

class _PanneRelaisWidgetState extends State<PanneRelaisWidget> with TickerProviderStateMixin {
  late PanneRelaisModel _model;
  ReparationInfoStruct previousTaskInfo = ReparationInfoStruct();
  List<InstalledDeviceStruct> devicesInstalled = [];
  List<CarStruct> vehicules = [];
  List<CarStruct> selectedVehicule = [];

  bool _isButtonEnable = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanneRelaisModel());
    GetTasksCall();
    _model.textControllerNameClient ??= TextEditingController();
    _model.textFieldFocusNodeNameClient ??= FocusNode();

    _model.textControllerIMEI ??= TextEditingController();
    _model.textFieldFocusNodeIMEI ??= FocusNode();

    _model.textControllerMatricule ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textControllerObsirvation ??= TextEditingController();
    _model.textFieldFocusNodeObsirvation ??= FocusNode();
  }

  bool checkValidateForm() {
    setState(() {
      _isButtonEnable = !_isButtonEnable;
    });
    bool is_validate = true;
    if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
      is_validate = false;
    }
    if (_model.uploadedLocalFiles_panneTaskMedia.isEmpty) {
      is_validate = false;
      setState(() => _model.textControllerImagesValidator = "Veuillez choisir au moins 3 images");
    }
    if (_model.dropDownValue == null) {
      is_validate = false;
      setState(() => _model.dropDownValueTypeReleyValidator = "Veuillez choisir une option");
    }
    switch (is_validate) {
      case false:
        setState(() {
          _isButtonEnable = !_isButtonEnable;
        });
        return false;
      case true:
    }
    return true;
  }

  Future<ReparationInfoStruct> GetTasksCall() async {
    _model.apiResultInfoTask = await TechnicienGroup.getTasksCall.call(widget.infoTask?.id);
    if ((_model.apiResultInfoTask?.succeeded ?? true)) {
      safeSetState(() {
        previousTaskInfo = ReparationInfoStruct.maybeFromMap(_model.apiResultInfoTask?.jsonBody) as ReparationInfoStruct;
        devicesInstalled = previousTaskInfo.allDeviceInstalled;
        vehicules = previousTaskInfo.vehicules;
      });
    }
    return previousTaskInfo;
  }

  Future<void> endPanneRelais() async {
    final checkValidation = checkValidateForm();
    if (!checkValidation) return;
    final panneRelaisData = PanneRelaisSubmitStruct(
      IMEI: _model.textControllerIMEI.text,
      matricule: _model.textControllerMatricule.text,
      observation: _model.textControllerObsirvation.text,
      images: _model.uploadedLocalFiles_panneTaskMedia,
      typeRelais: _model.dropDownValue,
    );
    try {
      _model.apiResponsePanneRelaisSubmit = await TechnicienGroup.changeRelaiCall.call(widget.infoTask?.id, panneRelaisData);
      if (_model.apiResponsePanneRelaisSubmit?.succeeded ?? true) {
        context.read<TachesProvider>().updateTaskFromTechnicianTasks(widget.infoTask!.id, 2);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Panne Relais soumise avec succès',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        Navigator.of(context)
          ..pop()
          ..pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Échec de la soumission de la panne GPS',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Une erreur est survenue lors de la soumission de la changement relais',
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
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
  }

  Future<String> setMatricule(option) async {
    selectedVehicule = await vehicules.where((vehicule) => vehicule.id.toString().contains(option.toString())).toList();
    return _model.textControllerMatricule.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Changement du Relais',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: (_model.apiResponseCompleter ??= Completer<ApiCallResponse>()..complete(TechnicienGroup.getTasksCall.call(widget.infoTask?.id))).future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
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
                              final textFieldPanneTaskResponse = snapshot.data!;

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: TextEditingController(text: widget.infoTask?.clientName),
                                      focusNode: _model.textFieldFocusNodeNameClient,
                                      autofocus: false,
                                      obscureText: false,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: 'Nom du client',
                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                            ),
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
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                        filled: true,
                                        fillColor: Colors.grey.shade400,
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
                                      cursorColor: FlutterFlowTheme.of(context).primary,
                                      validator: _model.textControllerNameClientValidator.asValidator(context),
                                    ),
                                    Autocomplete<InstalledDeviceStruct>(
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<InstalledDeviceStruct>.empty();
                                        }
                                        return devicesInstalled.where((imei) => imei.serialNumber.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
                                      },
                                      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                        return TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          onChanged: ((value) {
                                            setState(() {
                                              _model.textControllerMatricule.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
                                            });
                                          }),
                                          decoration: InputDecoration(
                                            labelText: 'IMEI',
                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                ),
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
                                                color: FlutterFlowTheme.of(context).alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).primary,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                                          cursorColor: FlutterFlowTheme.of(context).primary,
                                          validator: _model.textControllerIMEIValidator.asValidator(context),
                                        );
                                      },
                                      optionsViewBuilder: ((context, onSelected, options) {
                                        return Material(
                                          child: ListView.builder(
                                              itemCount: options.length,
                                              itemBuilder: (context, index) {
                                                final option = options.elementAt(index);
                                                return ListTile(
                                                  title: Text(option.serialNumber.toString()),
                                                  onTap: () {
                                                    onSelected(option);
                                                    setState(() {
                                                      _model.textControllerMatricule.text = setMatricule(option.vehiculeId).toString();
                                                      _model.textControllerIMEI.text = option.serialNumber.toString();
                                                    });
                                                  },
                                                );
                                              }),
                                        );
                                      }),
                                      displayStringForOption: (InstalledDeviceStruct option) => option.serialNumber,
                                    ),
                                    TextFormField(
                                      controller: _model.textControllerMatricule,
                                      focusNode: _model.textFieldFocusNode3,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Matricule',
                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                            ),
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
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                                      cursorColor: FlutterFlowTheme.of(context).primary,
                                      validator: _model.textControllerMatriculeValidator.asValidator(context),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model.dropDownValueController ??= FormFieldController<String>(null),
                                      options: ['Normal', 'Spécial '],
                                      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                                      width: double.infinity,
                                      height: 52.0,
                                      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                          ),
                                      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                      textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                          ),
                                      hintText: 'Type du relais',
                                      searchHintText: 'Search for an item...',
                                      searchCursorColor: FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: _model.dropDownValueTypeReleyValidator == null ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).error,
                                      borderWidth: 2.0,
                                      borderRadius: 12.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 8.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    ),

                                    /// Validation  Error Message

                                    if (_model.dropDownValueTypeReleyValidator != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          _model.dropDownValueTypeReleyValidator!,
                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                ),
                                                color: FlutterFlowTheme.of(context).error,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              ),
                                        ),
                                      ),
                                    InkWell(
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
                                          safeSetState(() => _model.isDataUploading_panneTaskMedia = true);
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
                                            _model.isDataUploading_panneTaskMedia = false;
                                          }
                                          if (selectedUploadedFiles.length == selectedMedia.length) {
                                            final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                            safeSetState(() {
                                              _model.uploadedImagesURLs = selectedUploadedFiles;
                                              _model.uploadedLocalFiles_panneTaskMedia = imagesJson;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 500.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: _model.textControllerImagesValidator != null ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.add_a_photo_rounded,
                                                color: FlutterFlowTheme.of(context).alternate,
                                                size: 32.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Upload Screenshot',
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
                                    Builder(
                                      builder: (context) {
                                        final selectedImages = _model.uploadedImagesURLs.toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(selectedImages.length, (selectedImagesIndex) {
                                              final selectedImagesItem = selectedImages[selectedImagesIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: Image.memory(
                                                    selectedImagesItem.bytes ?? Uint8List.fromList([]),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                    if (_model.textControllerImagesValidator != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          _model.textControllerImagesValidator!,
                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                ),
                                                color: FlutterFlowTheme.of(context).error,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              ),
                                        ),
                                      ),

                                    TextFormField(
                                      controller: _model.textControllerObsirvation,
                                      focusNode: _model.textFieldFocusNodeObsirvation,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                            ),
                                        hintText: 'Observation...',
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
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).error,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
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
                                      maxLines: 16,
                                      minLines: 6,
                                      cursorColor: FlutterFlowTheme.of(context).primary,
                                      validator: _model.textControllerObsirvationValidator.asValidator(context),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _isButtonEnable ? await endPanneRelais() : null;
                                        },
                                        text: 'Enregistrer',
                                        icon: Icon(
                                          Icons.receipt_long,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding: EdgeInsets.all(0.0),
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
                                          elevation: 4.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(60.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
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
