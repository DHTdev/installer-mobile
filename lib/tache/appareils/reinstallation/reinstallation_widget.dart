import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/car_struct.dart';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reinstallation_task_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
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
import 'reinstallation_model.dart';
export 'reinstallation_model.dart';

class ReinstallationWidget extends StatefulWidget {
  ReinstallationWidget({super.key, this.infoTask});

  static String routeName = 'Reinstallation';
  static String routePath = '/reinstallation';
  final TechnicianTaskStruct? infoTask;

  @override
  State<ReinstallationWidget> createState() => _ReinstallationWidgetState();
}

class _ReinstallationWidgetState extends State<ReinstallationWidget> with TickerProviderStateMixin {
  late ReinstallationModel _model;
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
    _model = createModel(context, () => ReinstallationModel());
    GetTasksCall();
    _model.textControllerIMEI ??= TextEditingController();
    _model.textFieldFocusIMEI ??= FocusNode();

    _model.textControllerAncientMatricule ??= TextEditingController();
    _model.textFieldFocusNodeAncientMatricule ??= FocusNode();

    _model.textControllerSimCombinat ??= TextEditingController();
    _model.textFieldFocusNodeSimCombinat ??= FocusNode();

    _model.textControllerNewMatricule ??= TextEditingController();
    _model.textFieldFocusNodeNewMatricule ??= FocusNode();

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

  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.textControllerAncientMatricule.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
    _model.onUpdate();
  }

  Future<void> sendReianstallationTask() async {
    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate() ||
        _model.isDataUploading_reinstallatioTaskState.isEmpty ||
        _model.dropDownValueGpsPosition == null ||
        _model.dropDownValueTypeReley == null) {
      setState(() {
        _model.textControllerImagesValidator = "Veuillez choisir au moins une image";
        _model.dropDownValueGpsPositionValidator = "Veuillez choisir une position GPS";
        _model.dropDownValueTypeReleyValidator = "Veuillez choisir un type de relais";
      });
      return;
    }

    final reinstallationTalsData = ReinstallationTaskStruct(
      NouvelleMatricule: _model.textControllerNewMatricule.text,
      nsim: _model.textControllerSimCombinat.text,
      statut: 1,
      imei: _model.textControllerIMEI.text,
      images: _model.isDataUploading_reinstallatioTaskState,
    );
    try {
      _model.responseReinstallationTask = await TechnicienGroup.reinstallationTaskCall.call(widget.infoTask?.id, reinstallationTalsData);
      if ((_model.responseReinstallationTask?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'L’opération de reinstallation a été menée à bien.',
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
        print(_model.responseReinstallationTask?.statusCode);
      }
    } catch (e) {
      print(e);
    }
        setState(() {
      _isButtonEnabled = false;
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
            'Reinstallation',
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
                              widget.infoTask!.clientName,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  controller: _model.textControllerAncientMatricule,
                                  focusNode: _model.textFieldFocusNodeAncientMatricule,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Ancien Matricule',
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
                                  validator: _model.textControllerAncientMatriculeValidator.asValidator(context),
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
                                  validator: _model.textController3Validator.asValidator(context),
                                ),
                                TextFormField(
                                  controller: _model.textControllerNewMatricule,
                                  focusNode: _model.textFieldFocusNodeNewMatricule,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nouvelle Matricule',
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
                                  validator: _model.textControllerNewMatriculeValidator.asValidator(context),
                                ),
                                // Generated code for this DropDown Widget...
                                FlutterFlowDropDown<bool>(
                                  controller: _model.dropDownValueControllerGpsPosition ??= FormFieldController<bool>(null),
                                  options: List<bool>.from([
                                    false,
                                    true,
                                  ]),
                                  optionLabels: ['principale(1er)', 'secondaire(2eme)'],
                                  onChanged: (val) => safeSetState(() => _model.dropDownValueGpsPosition = val),
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
                                  hintText: 'Position GPS',
                                  searchHintText: 'Search for an item...',
                                  searchCursorColor: FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 24,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  elevation: 2,
                                  borderColor: _model.dropDownValueGpsPositionValidator == null ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).error,
                                  borderWidth: 2,
                                  borderRadius: 12,
                                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 8, 4),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                                if (_model.dropDownValueGpsPositionValidator != null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.0, 0.0, 0.0),
                                    child: Text(
                                      _model.dropDownValueGpsPositionValidator!,
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

                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueControllerTypeReley ??= FormFieldController<String>(
                                    _model.dropDownValueTypeReley ??= '',
                                  ),
                                  options: List<String>.from([
                                    'none',
                                    'normal',
                                    'spécial',
                                  ]),
                                  optionLabels: ['Sans Relais', 'Normal', 'Spécial'],
                                  onChanged: (val) => safeSetState(() => _model.dropDownValueTypeReley = val),
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
                                  hintText: 'normal / spécial',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 24,
                                  ),
                                  searchCursorColor: FlutterFlowTheme.of(context).primary,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  elevation: 2,
                                  borderColor: _model.dropDownValueTypeReleyValidator == null ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).error,
                                  borderWidth: 2,
                                  borderRadius: 12,
                                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 8, 4),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
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
                                                  safeSetState(() => _model.isDataUploading_reistallationTaskState = true);
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
                                                    _model.isDataUploading_reistallationTaskState = false;
                                                  }
                                                  if (selectedUploadedFiles.length == selectedMedia.length) {
                                                    final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                                    safeSetState(() {
                                                      _model.isDataUploading_reinstallatioTaskState = imagesJson;
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
                                    )),
                                if (_model.textControllerImagesValidator != null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.0, 0.0, 0.0),
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
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              _isButtonEnabled ? sendReianstallationTask() : null;
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
                  );
                }),
          ),
        ),
      ),
    );
  }
}
