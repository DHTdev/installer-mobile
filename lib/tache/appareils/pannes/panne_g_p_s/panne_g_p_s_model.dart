import 'dart:async';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panne_g_p_s_widget.dart' show PanneGPSWidget;
import 'package:flutter/material.dart';

class PanneGPSModel extends FlutterFlowModel<PanneGPSWidget> {
  ///  Local state fields for this page.
  ApiCallResponse? apiResultDevicesByTech;
  ApiCallResponse? apiResultPreviousTaskByTech;
  ApiCallResponse? apiResultPanneGPSSubmit;
  Completer<ApiCallResponse>? apiResponseCompleter;
  String? selectedIMEI;
  DeviceStruct technicianDevices = DeviceStruct();
  List<GpsStruct> imei = [];
  final newIMEIKey = GlobalKey();

  ///  State fields for stateful widgets in this page.
  final formKey = GlobalKey<FormState>();
  // State field(s) for ClientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  // State field(s) for IMEI widget.
  FocusNode? imeiFocusNode;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  // State field(s) for sim relating widget.
  FocusNode? textFieldFocusNodeSimCombinat;
  TextEditingController? textControllerSimCombinat;
  String? textControllerSimValidator;

  // State field(s) for NewIMEI widget.
  FocusNode? newIMEIFocusNode;
  TextEditingController? newIMEITextController;
  String? newIMEISelectedOption;
  String? Function(BuildContext, String?)? newIMEITextControllerValidator;
  String? _newIMEITextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'IMEI is required';
    }

    return null;
  }
  // State field(s) for Matricule widget.
  FocusNode? matriculeFocusNode;
  TextEditingController? matriculeTextController;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;
    String? _newMatriculeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Matricule is required';
    }

    return null;
  }

  // State field(s) for Endroit widget.
  String? endroitValue;
  FormFieldController<String>? endroitValueController;
  // State field(s) for GPSPosition widget.
  bool? dropDownValueGpsPosition;
  FormFieldController<bool>? dropDownValueControllerGpsPosition;
  String? dropDownValueGpsPositionValidator;

  // State field(s) for TypeRelais widget.
  String? typeRelaisValue;
  FormFieldController<String>? typeRelaisValueController;
  String? dropDownValueTypeReleyValidator;
  // State field(s) for panneGPSPanneTaskMedia widget(images).
  String? textControllerImagesValidator;

  bool isDataUploading_gPSPanneTaskMedia = false;
  List<FFUploadedFile> uploadedImagesURLs = [];
  List<Map<String, dynamic>> uploadedLocalFiles_gPSPanneTaskMedia = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {
    matriculeTextControllerValidator = _newMatriculeTextControllerValidator;
    newIMEITextControllerValidator = _newIMEITextControllerValidator;
  }

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    imeiFocusNode?.dispose();
    imeiTextController?.dispose();

    textFieldFocusNodeSimCombinat?.dispose();
    textControllerSimCombinat?.dispose();

    newIMEIFocusNode?.dispose();
    newIMEITextController?.dispose();

    matriculeFocusNode?.dispose();
    matriculeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
