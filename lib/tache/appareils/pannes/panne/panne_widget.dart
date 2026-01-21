import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:mobile_installer/backend/schema/structs/car_struct.dart';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/panne_submit_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/flutter_flow/upload_data.dart';
import 'package:mobile_installer/tache/appareils/pannes/panne_g_p_s/panne_g_p_s_widget.dart';
import 'package:mobile_installer/tache/appareils/pannes/panne_relais/panne_relais_widget.dart';
import 'package:mobile_installer/tache/appareils/pannes/panne_s_i_m/panne_s_i_m_widget.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'panne_model.dart';
export 'panne_model.dart';

class PanneWidget extends StatefulWidget {
  const PanneWidget({
    super.key,
    this.infoTask,
  });

  final TechnicianTaskStruct? infoTask;

  static String routeName = 'Panne';
  static String routePath = '/panne';

  @override
  State<PanneWidget> createState() => _PanneWidgetState();
}

class _PanneWidgetState extends State<PanneWidget> with TickerProviderStateMixin {
  late PanneModel _model;
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
    _model = createModel(context, () => PanneModel());
    GetTasksCall();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.imeiTextController ??= TextEditingController();
    _model.textFieldFocusIMEI ??= FocusNode();

    _model.matriculeTextController ??= TextEditingController();
    _model.textFieldFocusMatricule ??= FocusNode();
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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
    _model.apiResultPanneTask = await TechnicienGroup.getTasksCall.call(widget.infoTask?.id);

    if ((_model.apiResultPanneTask?.succeeded ?? true)) {
      safeSetState(() {
        previousTaskInfo = ReparationInfoStruct.maybeFromMap(_model.apiResultPanneTask?.jsonBody) as ReparationInfoStruct;
        devicesInstalled = previousTaskInfo.allDeviceInstalled;
        vehicules = previousTaskInfo.vehicules;
      });
    }
    return previousTaskInfo;
  }

  Future<String> setMatricule(option) async {
    selectedVehicule = await vehicules.where((vehicule) => vehicule.id.toString().contains(option.toString())).toList();
    return _model.matriculeTextController.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
  }

  Future<void> endTaskPanne() async {
    final panneData = PanneSubmitStruct(
      imei: _model.imeiTextController.text,
      observation: _model.textController4.text,
      matricule: _model.matriculeTextController.text,
      images: _model.uploadedLocalFiles_panneTaskMedia,
    );
    _model.apiResultPanneSubmit = await TechnicienGroup.panneTaskCall.call(
      id: widget.infoTask?.id,
      panneData: panneData,
    );
    if (_model.apiResultPanneSubmit?.succeeded == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Panne soumise avec succès',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).primary,
        ),
      );
      context.read<TachesProvider>().updateTaskFromTechnicianTasks(widget.infoTask!.id, 2);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Échec de la soumission de la panne',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
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
            'Panne',
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
                          future: (_model.apiResponseCompleter ??= Completer<ApiCallResponse>()
                                ..complete(TechnicienGroup.getTasksCall.call(
                                  widget.infoTask?.id,
                                )))
                              .future,
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
                                    controller: _model.textController1 ??= TextEditingController(
                                      text: widget.infoTask?.clientName,
                                    ),
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    readOnly: true,
                                    obscureText: false,
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
                                  ),
                                  // Generated code for this DropDown Widget...
                                  FlutterFlowDropDown<String>(
                                    controller: _model.dropDownValueController ??= FormFieldController<String>(
                                      _model.dropDownValue ??= _model.selectOption,
                                    ),
                                    options: ['Changement de GPS', 'Changement de SIM', 'Reparation du relais'],
                                    onChanged: (val) async {
                                      safeSetState(() => _model.dropDownValue = val);
                                      if (val == 'Changement de GPS') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (context) => PanneGPSWidget(infoTask: widget.infoTask),
                                            ));
                                      } else if (val == 'Changement de SIM') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (context) => PanneSIMWidget(infoTask: widget.infoTask),
                                            ));
                                      } else if (val == 'Reparation du relais') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (context) => PanneRelaisWidget(infoTask: widget.infoTask),
                                            ));
                                      }
                                    },
                                    width: double.infinity,
                                    height: 52,
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
                                    hintText: 'Select type de panne',
                                    searchHintText: 'Search for an item...',
                                    searchCursorColor: FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 24,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2,
                                    borderRadius: 12,
                                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 8, 4),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),

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
                                        onChanged: ((value) {
                                          setState(() {
                                            _model.matriculeTextController.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
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
                                        validator: _model.imeiTextControllerValidator.asValidator(context),
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
                                                  _model.matriculeTextController.text = setMatricule(option.vehiculeId).toString();
                                                  _model.imeiTextController.text = option.serialNumber;
                                                });
                                              });
                                        },
                                      ));
                                    }),
                                    displayStringForOption: (InstalledDeviceStruct option) => option.serialNumber,
                                  ),
                                  TextFormField(
                                    controller: _model.matriculeTextController,
                                    focusNode: _model.textFieldFocusMatricule,
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
                                    validator: _model.matriculeTextControllerValidator.asValidator(context),
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
                                  TextFormField(
                                    controller: _model.textController4,
                                    focusNode: _model.textFieldFocusNode4,
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
                                      hintText: 'description de la panne...',
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
                                    validator: _model.textController4Validator.asValidator(context),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _isButtonEnable ? await endTaskPanne() : null;
                                      },
                                      text: 'Valider',
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
    );
  }
}
