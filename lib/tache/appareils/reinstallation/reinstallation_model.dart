import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reinstallation_widget.dart' show ReinstallationWidget;
import 'package:flutter/material.dart';

class ReinstallationModel extends FlutterFlowModel<ReinstallationWidget> {
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? apiResultTaskDesinstallationByTech;
  ApiCallResponse? responseReinstallationTask;
  Completer<ApiCallResponse>? apiResponseCompleter;
  final formKey = GlobalKey<FormState>();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusIMEI;
  TextEditingController? textControllerIMEI;
  String? Function(BuildContext, String?)? textControllerImeiValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeAncientMatricule;
  TextEditingController? textControllerAncientMatricule;
  String? Function(BuildContext, String?)? textControllerAncientMatriculeValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeSimCombinat;
  TextEditingController? textControllerSimCombinat;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeNewMatricule;
  TextEditingController? textControllerNewMatricule;
  String? Function(BuildContext, String?)? textControllerNewMatriculeValidator;
  String? _newMatriculeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Matricule is required';
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
  // State field(s) for TextField widget(images).
  String? textControllerImagesValidator;
  bool isDataUploading_reistallationTaskState = false;
  List<Map<String, dynamic>> isDataUploading_reinstallatioTaskState = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeObsirvation;
  TextEditingController? textControllerObsirvation;
  String? Function(BuildContext, String?)? textControllerObsirvationValidator;

  @override
  void initState(BuildContext context) {
    textControllerNewMatriculeValidator = _newMatriculeTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusIMEI?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNodeAncientMatricule?.dispose();
    textControllerAncientMatricule?.dispose();

    textFieldFocusNodeSimCombinat?.dispose();
    textControllerSimCombinat?.dispose();

    textFieldFocusNodeNewMatricule?.dispose();
    textControllerNewMatricule?.dispose();

    textFieldFocusNodeObsirvation?.dispose();
    textControllerObsirvation?.dispose();
  }
}
