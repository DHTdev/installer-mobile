import 'dart:async';
import 'package:mobile_installer/backend/schema/structs/installed_device_struct.dart';
import 'package:mobile_installer/backend/schema/structs/panne_gps_submit_struct.dart';
import 'package:mobile_installer/backend/schema/structs/reparation_info_struct.dart';
import 'package:mobile_installer/compenents/listOfSelection/list_of_Selection_widget.dart';
import 'package:mobile_installer/flutter_flow/upload_data.dart';
import 'package:mobile_installer/tache/taches/taches_provider.dart';
import 'package:provider/provider.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'panne_g_p_s_model.dart';
export 'panne_g_p_s_model.dart';

class PanneGPSWidget extends StatefulWidget {
  const PanneGPSWidget({
    super.key,
    required this.infoTask,
  });

  final TechnicianTaskStruct? infoTask;
  static String routeName = 'PanneGPS';
  static String routePath = '/panneGPS';

  @override
  State<PanneGPSWidget> createState() => _PanneGPSWidgetState();
}

class _PanneGPSWidgetState extends State<PanneGPSWidget> {
  late PanneGPSModel _model;
  bool _isButtonEnabled = true;

  ReparationInfoStruct previousTaskInfo = ReparationInfoStruct();
  List<InstalledDeviceStruct> devicesInstalled = [];
  List<CarStruct> vehicules = [];
  String? serial_numberCombination;
  List<CarStruct> selectedVehicule = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanneGPSModel());
    GetTasksCall();
    GetDeviceInfoCall();
    _model.clientNameTextController ??= TextEditingController(text: widget.infoTask?.clientName);
    _model.clientNameFocusNode ??= FocusNode();

    _model.imeiTextController ??= TextEditingController();
    _model.imeiFocusNode ??= FocusNode();

    _model.newIMEITextController ??= TextEditingController();
    _model.newIMEIFocusNode ??= FocusNode();

    _model.matriculeTextController ??= TextEditingController();
    _model.matriculeFocusNode ??= FocusNode();

    _model.textControllerSimCombinat ??= TextEditingController();
    _model.textFieldFocusNodeSimCombinat ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  Future<DeviceStruct> GetDeviceInfoCall() async {
    _model.apiResultDevicesByTech = await TechnicienGroup.appareilsCall.call();

    if ((_model.apiResultDevicesByTech?.succeeded ?? true)) {
      _model.technicianDevices = DeviceStruct.maybeFromMap((_model.apiResultDevicesByTech?.jsonBody ?? '')) as DeviceStruct;
      safeSetState(() {
        _model.imei = _model.technicianDevices.gps.toList();
      });
    }
    return _model.technicianDevices;
  }

  Future<ReparationInfoStruct> GetTasksCall() async {
    _model.apiResultPreviousTaskByTech = await TechnicienGroup.getTasksCall.call(widget.infoTask?.id);

    if ((_model.apiResultPreviousTaskByTech?.succeeded ?? true)) {
      safeSetState(() {
        previousTaskInfo = ReparationInfoStruct.maybeFromMap(_model.apiResultPreviousTaskByTech?.jsonBody) as ReparationInfoStruct;
        devicesInstalled = previousTaskInfo.allDeviceInstalled;
        vehicules = previousTaskInfo.vehicules;
      });
    }
    return previousTaskInfo;
  }

  bool checkValidateForm() {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
    bool is_validate = true;
    if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
      is_validate = false;
    }
    if (_model.uploadedLocalFiles_gPSPanneTaskMedia.isEmpty) {
      is_validate = false;
      setState(() => _model.textControllerImagesValidator = "Veuillez choisir au moins 3 images");
    }
    if (_model.dropDownValueGpsPosition == null) {
      is_validate = false;
      setState(() => _model.dropDownValueGpsPositionValidator = "Veuillez choisir une option");
    }
    if (_model.typeRelaisValue == null) {
      is_validate = false;
      setState(() => _model.dropDownValueTypeReleyValidator = "Veuillez choisir une option");
    }
    switch (is_validate) {
      case false:
        setState(() {
          _isButtonEnabled = !_isButtonEnabled;
        });
        return false;
      case true:
    }
    return true;
  }

  Future<void> endPnneGPS() async {
    final result = checkValidateForm();
    if (result == false) return;
    final panneGPSData = PanneGpsSubmitStruct(
      imei: _model.newIMEISelectedOption.toString(),
      matricule: _model.matriculeTextController.text,
      ancienneIMEI: _model.imeiTextController.text,
      nsim: _model.textControllerSimCombinat.text,
      observation: _model.textController6.text,
      special: _model.endroitValue,
      statut: _model.dropDownValueGpsPosition,
      typeRelay: _model.typeRelaisValue,
      images: _model.uploadedLocalFiles_gPSPanneTaskMedia,
    );
    try {
      _model.apiResultPanneGPSSubmit = await TechnicienGroup.changeDeviceCall.call(
        widget.infoTask?.id,
        panneGPSData,
      );
      if ((_model.apiResultPanneGPSSubmit?.succeeded ?? true)) {
        context.read<TachesProvider>().updateTaskFromTechnicianTasks(widget.infoTask!.id, 2);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Panne GPS soumise avec succès',
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
        context.pop();
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
            'Une erreur est survenue lors de la soumission de la panne GPS',
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
    return _model.matriculeTextController.text = selectedVehicule.isNotEmpty ? selectedVehicule.first.matricule : '';
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
            'Changement GPS',
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
                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 0.0),
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
                                  TextFormField(
                                    controller: _model.clientNameTextController,
                                    focusNode: _model.clientNameFocusNode,
                                    autofocus: true,
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
                                    validator: _model.clientNameTextControllerValidator.asValidator(context),
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
                                                  _model.textControllerSimCombinat.text = option.latestSimRelating.isNotEmpty ? option.latestSimRelating.first.serialNumber : '';
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
                                    focusNode: _model.matriculeFocusNode,
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
                                    validator: _model.matriculeTextControllerValidator.asValidator(context),
                                  ),
                                  Autocomplete<String>(
                                    initialValue: TextEditingValue(),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return _model.imei.map((e) => e.serialNumber).toList().where((option) {
                                        final lowercaseOption = option.toLowerCase();
                                        return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    optionsViewBuilder: (context, onSelected, options) {
                                      return AutocompleteOptionsList(
                                        textFieldKey: _model.newIMEIKey,
                                        textController: _model.newIMEITextController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                        textHighlightStyle: TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                        optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        maxHeight: 200.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      safeSetState(() => _model.newIMEISelectedOption = selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      return TextFormField(
                                        keyboardType: TextInputType.number,
                                        key: _model.newIMEIKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nouvel IMEI',
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
                                        validator: _model.newIMEITextControllerValidator.asValidator(context),
                                      );
                                    },
                                  ),
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
                                                  setState(() => _model.textControllerSimCombinat.text = selectedSim);
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
                                                valueOrDefault(_model.textControllerSimCombinat.text, "Nouvelle SIM"),
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

                                  /// Remettre Chez Dropdown
                                  FlutterFlowDropDown<String>(
                                    controller: _model.endroitValueController ??= FormFieldController<String>(
                                      _model.endroitValue ??= widget.infoTask?.gps_principale.toString(),
                                    ),
                                    options: List<String>.from([
                                      'client',
                                    ]),
                                    optionLabels: [
                                      'Client',
                                    ],
                                    onChanged: (val) => safeSetState(() => _model.endroitValue = val),
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

                                  /// GPS Position Dropdown
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

                                  /// Type Relais Dropdown
                                  FlutterFlowDropDown<String>(
                                    controller: _model.typeRelaisValueController ??= FormFieldController<String>(
                                      _model.typeRelaisValue ??= '',
                                    ),
                                    options: List<String>.from([
                                      'none',
                                      'normal',
                                      'spécial',
                                    ]),
                                    optionLabels: ['Sans Relais', 'Normal', 'Spécial'],
                                    onChanged: (val) => safeSetState(() => _model.typeRelaisValue = val),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                          safeSetState(() => _model.isDataUploading_gPSPanneTaskMedia = true);
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
                                            _model.isDataUploading_gPSPanneTaskMedia = false;
                                          }
                                          if (selectedUploadedFiles.length == selectedMedia.length) {
                                            final imagesJson = await prepareImagesForLaravel(selectedUploadedFiles);

                                            safeSetState(() {
                                              _model.uploadedImagesURLs = selectedUploadedFiles;
                                              _model.uploadedLocalFiles_gPSPanneTaskMedia = imagesJson;
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
                                    controller: _model.textController6,
                                    focusNode: _model.textFieldFocusNode,
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _isButtonEnabled ? await endPnneGPS() : null;
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
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
