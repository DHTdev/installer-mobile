import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panne_relais_widget.dart' show PanneRelaisWidget;
import 'package:flutter/material.dart';

class PanneRelaisModel extends FlutterFlowModel<PanneRelaisWidget> {
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? apiResultDevicesByTech;
  ApiCallResponse? apiResponsePanneRelaisSubmit;
  Completer<ApiCallResponse>? apiResponseCompleter;
  ApiCallResponse? apiResultInfoTask;

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeNameClient;
  TextEditingController? textControllerNameClient;
  String? Function(BuildContext, String?)? textControllerNameClientValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeIMEI;
  TextEditingController? textControllerIMEI;
  String? Function(BuildContext, String?)? textControllerIMEIValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textControllerMatricule;
  String? Function(BuildContext, String?)? textControllerMatriculeValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  String? dropDownValueTypeReleyValidator;
  
  bool isDataUploading_uploadDataOk8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOk8 = FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeObsirvation;
  TextEditingController? textControllerObsirvation;
  String? Function(BuildContext, String?)? textControllerObsirvationValidator;

  // State field(s) for panneGPSPanneTaskMedia widget(images).
  String? textControllerImagesValidator;

  bool isDataUploading_panneTaskMedia = false;
  List<FFUploadedFile> uploadedImagesURLs = [];
  List<Map<String, dynamic>> uploadedLocalFiles_panneTaskMedia = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNodeNameClient?.dispose();
    textControllerNameClient?.dispose();

    textFieldFocusNodeIMEI?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNode3?.dispose();
    textControllerMatricule?.dispose();

    textFieldFocusNodeObsirvation?.dispose();
    textControllerObsirvation?.dispose();
  }
}
