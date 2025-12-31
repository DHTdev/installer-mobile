import 'dart:async';

import 'package:mobile_installer/backend/schema/structs/car_struct.dart';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/panne_sim_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/compenents/listOfSelection/list_of_Selection_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'panne_s_i_m_model.dart';
export 'panne_s_i_m_model.dart';

class PanneSIMWidget extends StatefulWidget {
  PanneSIMWidget({
    super.key,
    this.infoTask,
  });

  final TechnicianTaskStruct? infoTask;

  static String routeName = 'PanneSIM';
  static String routePath = '/panneSIM';

  @override
  State<PanneSIMWidget> createState() => _PanneSIMWidgetState();
}

class _PanneSIMWidgetState extends State<PanneSIMWidget> with TickerProviderStateMixin {
  late PanneSIMModel _model;
  ReparationInfoStruct previousTaskInfo = ReparationInfoStruct();
  List<InstalledDeviceStruct> devicesInstalled = [];
  List<CarStruct> vehicules = [];
  String? serial_numberCombination;
  List<CarStruct> selectedVehicule = [];
  bool _isButtonEnabled = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanneSIMModel());
    GetTasksCall();
    _model.textControllerIMEI ??= TextEditingController();
    _model.textFieldFocusNodeIMEI ??= FocusNode();

    _model.textControllerSimCombinat ??= TextEditingController();
    _model.textFieldFocusNodeSimCombinat ??= FocusNode();

    _model.textControllerMatricule ??= TextEditingController();
    _model.textFieldFocusNodeMatricule ??= FocusNode();

    _model.textControllerObsirvation ??= TextEditingController();
    _model.textFieldFocusNodeObsirvation ??= FocusNode();
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

  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.textControllerMatricule.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
    _model.onUpdate();
  }

  Future<void> endPanneSim() async {
    if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate() || _model.isDataUploading_panneSimTask.isEmpty || _model.newSimSelected == null) {
      setState() {
        _model.textControllerImagesValidator = "Veuillez choisir au moins une image";
        _model.textControllerSimValidator = "Veuillez choisir une nouvelle SIM";
      }

      return;
    }
    setState(() {
      _isButtonEnabled = false;
    });
    final panneSimSubmitData = PanneSimSubmitStruct(
      imei: _model.textControllerIMEI.text,
      observation: _model.textControllerObsirvation.text,
      matricule: _model.textControllerMatricule.text,
      nouveauSim: _model.newSimSelected,
      images: _model.isDataUploading_panneSimTask,
    );
    try {
      await TechnicienGroup.changeSimidCall.call(widget.infoTask!.id, panneSimSubmitData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('La panne de la carte SIM a été traitée avec succès.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              )),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Oups — une erreur est survenue.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              )),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    } finally {
      setState(() {
        _isButtonEnabled = true;
      });
    }
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
            'Changement de SIM',
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
            child: FutureBuilder<ApiCallResponse>(
                future: (_model.apiResponseCompleter ??= Completer<ApiCallResponse>()..complete(TechnicienGroup.getTasksCall.call(widget.infoTask?.id))).future,
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
                  return Padding(
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 10.0),
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
                                    child: Column(
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
                                          autofocus: false,
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
                                          validator: _model.textControllerImeiValidator.asValidator(context),
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
                                                    _model.textControllerSimCombinat.text = option.latestSimRelating.isNotEmpty ? option.latestSimRelating.first.serialNumber : '';
                                                    _model.textControllerIMEI.text = option.serialNumber;
                                                  });
                                                });
                                          },
                                        ));
                                      }),
                                      displayStringForOption: (InstalledDeviceStruct option) => option.serialNumber,
                                    ),
                                    TextFormField(
                                      controller: _model.textControllerMatricule,
                                      focusNode: _model.textFieldFocusNodeMatricule,
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
                                    TextFormField(
                                      controller: _model.textControllerSimCombinat,
                                      focusNode: _model.textFieldFocusNodeSimCombinat,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Ancienne SIM',
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
                                      validator: _model.textController4Validator.asValidator(context),
                                    ),
                                    // Generated code for this Container Widget...
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context).unfocus();
                                                FocusManager.instance.primaryFocus?.unfocus();
                                              },
                                              child: Padding(
                                                padding: MediaQuery.viewInsetsOf(context),
                                                child: ListOfSelectionWidget(
                                                  onItemSelected: (selectedSim) {
                                                    setState(() => _model.newSimSelected = selectedSim);
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        constraints: BoxConstraints(
                                          maxWidth: 500,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: _model.textControllerSimValidator != null ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).alternate,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(3.0, 8.0, 5.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault(_model.newSimSelected, "Nouvelle SIM"),
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
                                    if (_model.textControllerSimValidator != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          _model.textControllerSimValidator!,
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
                                            color: _model.textControllerImagesValidator != null ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).alternate,
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
                                                    safeSetState(() => _model.isDataUploading_panneSimTaskState = true);
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
                                                      _model.isDataUploading_panneSimTaskState = false;
                                                    }
                                                    if (selectedUploadedFiles.length == selectedMedia.length) {
                                                      final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                                      safeSetState(() {
                                                        _model.isDataUploading_panneSimTask = imagesJson;
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
                                      ),
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
                                      validator: _model.textController6Validator.asValidator(context),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _isButtonEnabled ? await endPanneSim() : null;
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
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
