import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'panne_s_i_m_widget.dart' show PanneSIMWidget;
import 'package:flutter/material.dart';

class PanneSIMModel extends FlutterFlowModel<PanneSIMWidget> {
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? apiResultTaskDesinstallationByTech;
  Completer<ApiCallResponse>? apiResponseCompleter;
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeIMEI;
  TextEditingController? textControllerIMEI;
  String? Function(BuildContext, String?)? textControllerImeiValidator;
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

  // State field(s) for TextField widget.
  String? newSimSelected;
  String? textControllerSimValidator;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Imges widget.
  String? textControllerImagesValidator;
  bool isDataUploading_panneSimTaskState = false;
  List<Map<String, dynamic>> isDataUploading_panneSimTask = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeObsirvation;
  TextEditingController? textControllerObsirvation;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isDataUploading_uploadDataIpr = false;
  FFUploadedFile uploadedLocalFile_uploadDataIpr = FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  get sims => null;

  @override
  void initState(BuildContext context) {
    textControllerMatriculeValidator = _matriculeTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNodeIMEI?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNodeSimCombinat?.dispose();
    textControllerSimCombinat?.dispose();

    textFieldFocusNodeMatricule?.dispose();
    textControllerMatricule?.dispose();

    textFieldFocusNodeObsirvation?.dispose();
    textControllerObsirvation?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();
  }
}
