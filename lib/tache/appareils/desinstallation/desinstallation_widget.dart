import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/backend/schema/structs/unistall_task_struct.dart';
import 'package:mobile_installer/flutter_flow/upload_data.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'desinstallation_model.dart';
export 'desinstallation_model.dart';

class DesinstallationWidget extends StatefulWidget {
  DesinstallationWidget({super.key, this.infoTask});

  static String routeName = 'Desinstallation';
  static String routePath = '/desinstallation';
  final TechnicianTaskStruct? infoTask;

  @override
  State<DesinstallationWidget> createState() => _DesinstallationWidgetState();
}

class _DesinstallationWidgetState extends State<DesinstallationWidget> with TickerProviderStateMixin {
  late DesinstallationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  ReparationInfoStruct previousTaskInfo = ReparationInfoStruct();
  List<InstalledDeviceStruct> devicesInstalled = [];
  List<CarStruct> vehicules = [];
  String? serial_numberCombination;
  List<CarStruct> selectedVehicule = [];
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => DesinstallationModel());
    GetTasksCall();

    _model.textControllerIMEI ??= TextEditingController();
    _model.textFieldFocusIMEI ??= FocusNode();

    _model.textControllerSimCombinat ??= TextEditingController();
    _model.textFieldFocusNodeSimCombinat ??= FocusNode();

    _model.textControllerMatricule ??= TextEditingController();
    _model.textFieldFocusNodeMatricule ??= FocusNode();

    _model.textControllerObsirvation ??= TextEditingController();
    _model.textFieldFocusNodeObsirvation ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 110.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) => anim.trigger == AnimationTrigger.onActionTrigger || !anim.applyInitialState),
      this,
    );
  }

  Future<ReparationInfoStruct> GetTasksCall() async {
    _model.apiResultTaskDesinstallationByTech = await TechnicienGroup.getTasksCall.call(widget.infoTask?.id);

    if ((_model.apiResultTaskDesinstallationByTech?.succeeded ?? true)) {
      safeSetState(() {
        previousTaskInfo = ReparationInfoStruct.maybeFromMap(_model.apiResultTaskDesinstallationByTech?.jsonBody) as ReparationInfoStruct;
        devicesInstalled = previousTaskInfo.allDeviceInstalled;
        vehicules = previousTaskInfo.vehicules;
      });
    }
    return previousTaskInfo;
  }

  Future<void> submitUninstallTask() async {
    if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate() || _model.isDataUploading_unistallationTask.isEmpty) {
      setState(() => _model.textControllerImagesValidator = "Veuillez choisir au moins une image");
      return;
    }
    // Implement the submission logic here
    final uninstallTaskInfo = UninstallTaskStruct(
      imei: _model.textControllerIMEI.text,
      nsim: _model.textControllerSimCombinat.text,
      matricule: _model.textControllerMatricule.text,
      observation: _model.textControllerObsirvation.text,
      special: _model.dropDownValue,
      images: _model.isDataUploading_unistallationTask, // Add logic to handle images if necessary
    );
    _model.apiResultUnistallationTask = await TechnicienGroup.uninstallTaskCall.call(widget.infoTask?.id, uninstallTaskInfo);
    if ((_model.apiResultUnistallationTask?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'L’opération de désinstallation a été menée à bien.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Oups — une erreur est survenue.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.textControllerMatricule.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
    _model.onUpdate();
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
              'Desinstallation',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
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
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "${widget.infoTask?.clientName}",
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
                          ),
                        ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Autocomplete<InstalledDeviceStruct>(
                                      optionsBuilder: (TextEditingValue textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return List<InstalledDeviceStruct>.empty();
                                        }
                                        return devicesInstalled.where((imei) => imei.serialNumber.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                                      },
                                      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                        return TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          onChanged: (value) {
                                            setState(() {
                                              _model.textControllerIMEI.text = value;
                                            });
                                          },
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
                                          validator: _model.textController1Validator.asValidator(context),
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
                                                    selectedVehicule = vehicules.where((vehicule) => vehicule.id.toString().contains(option.vehiculeId.toString())).toList();
                                                    _model.textControllerSimCombinat.text = option.latestSimRelating.first.serialNumber ?? "";
                                                    _model.textControllerIMEI.text = option.serialNumber;
                                                  });
                                                });
                                          },
                                        ));
                                      }),
                                      displayStringForOption: (InstalledDeviceStruct option) => option.serialNumber,
                                    ),
                                    TextFormField(
                                      controller: _model.textControllerSimCombinat,
                                      focusNode: _model.textFieldFocusNodeSimCombinat,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'SIM',
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
                                      validator: _model.textController2Validator.asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model.textControllerMatricule,
                                      focusNode: _model.textFieldFocusNodeMatricule,
                                      autofocus: true,
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
                                      controller: _model.dropDownValueController ??= FormFieldController<String>(
                                        _model.dropDownValue ??= widget.infoTask?.gps_principale.toString(),
                                      ),
                                      options: List<String>.from([
                                        'client',
                                      ]),
                                      optionLabels: [
                                        'Client',
                                      ],
                                      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                                      width: MediaQuery.of(context).size.width * 0.88,
                                      height: 41.8,
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
                                      hintText: 'Remettre Chez',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                                      borderWidth: 0,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 500.0,
                                        ),
                                        decoration: BoxDecoration(

                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: _model.textControllerImagesValidator != null
                                                ? FlutterFlowTheme.of(context).error
                                                : FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
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
                                                    safeSetState(() => _model.isDataUploading_unistallationTaskState = true);
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
                                                      _model.isDataUploading_unistallationTaskState = false;
                                                    }
                                                    if (selectedUploadedFiles.length == selectedMedia.length) {
                                                      final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                                      safeSetState(() {
                                                        _model.isDataUploading_unistallationTask = imagesJson;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
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
                                            ],
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                                    ),
                                    if(_model.textControllerImagesValidator != null)
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
                                      autofocus: true,
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
                                        hintText: 'Observations',
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
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    submitUninstallTask();
                                  },
                                  text: 'Envoyer',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
