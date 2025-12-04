import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'desinstallation_widget.dart' show DesinstallationWidget;
import 'package:flutter/material.dart';

class DesinstallationModel extends FlutterFlowModel<DesinstallationWidget> {
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? apiResultTaskDesinstallationByTech;
  ApiCallResponse? apiResultUnistallationTask;
  Completer<ApiCallResponse>? apiResponseCompleter;
  final formKey = GlobalKey<FormState>();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusIMEI;
  TextEditingController? textControllerIMEI;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeSimCombinat;
  TextEditingController? textControllerSimCombinat;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeMatricule;
  TextEditingController? textControllerMatricule;
  String? Function(BuildContext, String?)? textControllerMatriculeValidator;
  String? _matriculeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Matricule is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeObsirvation;
  TextEditingController? textControllerObsirvation;
  // State field(s) for Upload widget.
  String? textControllerImagesValidator ;
  bool isDataUploading_unistallationTaskState = false;
  List<Map<String, dynamic>> isDataUploading_unistallationTask = [];
  // String? _isDataUploading_unistallationTask(BuildContext context, String? val) {
  //   print("Images validator value: ${val}");
  //   if (val == null || val.isEmpty) {
  //     return 'Images is required';
  //   }

  //   return null;
  // }

  @override
  void initState(BuildContext context) {
    textControllerMatriculeValidator = _matriculeTextControllerValidator;
    // textControllerImagesValidator = _isDataUploading_unistallationTask;
  }

  @override
  void dispose() {
    textFieldFocusIMEI?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNodeSimCombinat?.dispose();
    textControllerSimCombinat?.dispose();

    textFieldFocusNodeMatricule?.dispose();
    textControllerMatricule?.dispose();

    textFieldFocusNodeObsirvation?.dispose();
    textControllerObsirvation?.dispose();
  }
}
