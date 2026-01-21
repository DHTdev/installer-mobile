import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panne_widget.dart' show PanneWidget;
import 'package:flutter/material.dart';

class PanneModel extends FlutterFlowModel<PanneWidget> {
  ///  State fields for stateful widgets in this page.

  ApiCallResponse? apiResultPanneTask;
  Completer<ApiCallResponse>? apiResponseCompleter;

  ApiCallResponse? apiResultPanneSubmit;
  Completer<ApiCallResponse>? apiResponseSubmitCompleter;


  String? selectOption;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusIMEI;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusMatricule;
  TextEditingController? matriculeTextController;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  // State field(s) for panneGPSPanneTaskMedia widget(images).
  String? textControllerImagesValidator;

  bool isDataUploading_panneTaskMedia = false;
  List<FFUploadedFile> uploadedImagesURLs = [];
  List<Map<String, dynamic>> uploadedLocalFiles_panneTaskMedia = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusIMEI?.dispose();
    imeiTextController?.dispose();

    textFieldFocusMatricule?.dispose();
    matriculeTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
