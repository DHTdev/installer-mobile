import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panne_relais_widget.dart' show PanneRelaisWidget;
import 'package:flutter/material.dart';

class PanneRelaisModel extends FlutterFlowModel<PanneRelaisWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ClientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  // State field(s) for Matricule widget.
  final matriculeKey = GlobalKey();
  FocusNode? matriculeFocusNode;
  TextEditingController? matriculeTextController;
  String? matriculeSelectedOption;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_uploadDataOk8 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataOk8 = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (changeRelai)] action in Button widget.
  ApiCallResponse? apiResultChR;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    matriculeFocusNode?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
