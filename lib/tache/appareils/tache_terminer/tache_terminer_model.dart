import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tache_terminer_widget.dart' show TacheTerminerWidget;
import 'package:flutter/material.dart';

class TacheTerminerModel extends FlutterFlowModel<TacheTerminerWidget> {
  ///  State fields for stateful widgets in this page.

  /// api response
  ApiCallResponse? apiResultGetDevicesByTech;
  ApiCallResponse? apiResultInstallationSubmit;
  final formKey = GlobalKey<FormState>();
  // API RESPONSE COMPLETER
  Completer<ApiCallResponse>? apiResponseCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeMatricule;
  TextEditingController? textControllerMatricule;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;

  String? _matriculeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Matricule is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textControllerIMEIFocus;
  TextEditingController? textControllerIMEI;
  String? Function(BuildContext, String?)? textControllerIMEIvalidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeSimCombinat;
  TextEditingController? textControllerSimCombinat;
  String? Function(BuildContext, String?)? nSimTextControllerValidator;

  String? _nSimTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'N Sim is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  bool? dropDownValueGpsPosition;
  FormFieldController<bool>? dropDownValueControllerGpsPosition;
  String? dropDownValueGpsPositionValidator;
  // State field(s) for DropDown widget.
  String? dropDownValueTypeReley;
  FormFieldController<String>? dropDownValueControllerTypeReley;
  String? dropDownValueTypeReleyValidator;
  // State field(s) for DropDown widget.
  String? dropDownValueAccessories;
  FormFieldController<String>? dropDownValueControllerAccessories;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeDescription;
  TextEditingController? textControllerDescription;
  String? Function(BuildContext, String?)? textControllerDescriptionValidator;
  // State field(s) for TextField widget.

  bool isDataUploading_tacheInstallation = false;
  List<FFUploadedFile> uploadedImagesURLs = [];
  List<Map<String, dynamic>> uploadedLocalFiles_tacheInstallation = [];
  String? textControllerImagesValidator;

  @override
  void initState(BuildContext context) {
    nSimTextControllerValidator = _nSimTextControllerValidator;
    matriculeTextControllerValidator = _matriculeTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNodeMatricule?.dispose();
    textControllerMatricule?.dispose();

    textControllerIMEIFocus?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNodeSimCombinat?.dispose();
    textControllerSimCombinat?.dispose();

    textFieldFocusNodeDescription?.dispose();
    textControllerDescription?.dispose();
  }
}
