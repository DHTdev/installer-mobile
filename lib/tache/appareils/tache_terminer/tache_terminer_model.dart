import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tache_terminer_widget.dart' show TacheTerminerWidget;
import 'package:flutter/material.dart';

class TacheTerminerModel extends FlutterFlowModel<TacheTerminerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Matricule widget.
  FocusNode? matriculeFocusNode;
  TextEditingController? matriculeTextController;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;
  String? _matriculeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Matricule is required';
    }

    return null;
  }

  // State field(s) for imei widget.
  FocusNode? imeiFocusNode;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  String? _imeiTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'IMEI is required';
    }

    return null;
  }

  // State field(s) for NSim widget.
  FocusNode? nSimFocusNode;
  TextEditingController? nSimTextController;
  String? Function(BuildContext, String?)? nSimTextControllerValidator;
  String? _nSimTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'N Sim is required';
    }

    return null;
  }

  // State field(s) for GPS_Position widget.
  String? gPSPositionValue;
  FormFieldController<String>? gPSPositionValueController;
  // State field(s) for Relais widget.
  String? relaisValue;
  FormFieldController<String>? relaisValueController;
  // State field(s) for Accessories widget.
  String? accessoriesValue;
  FormFieldController<String>? accessoriesValueController;
  bool isDataUploading_tacheInstallation = false;
  List<FFUploadedFile> uploadedLocalFiles_tacheInstallation = [];

  // State field(s) for Observation widget.
  FocusNode? observationFocusNode;
  TextEditingController? observationTextController;
  String? Function(BuildContext, String?)? observationTextControllerValidator;

  @override
  void initState(BuildContext context) {
    matriculeTextControllerValidator = _matriculeTextControllerValidator;
    imeiTextControllerValidator = _imeiTextControllerValidator;
    nSimTextControllerValidator = _nSimTextControllerValidator;
  }

  @override
  void dispose() {
    matriculeFocusNode?.dispose();
    matriculeTextController?.dispose();

    imeiFocusNode?.dispose();
    imeiTextController?.dispose();

    nSimFocusNode?.dispose();
    nSimTextController?.dispose();

    observationFocusNode?.dispose();
    observationTextController?.dispose();
  }
}
