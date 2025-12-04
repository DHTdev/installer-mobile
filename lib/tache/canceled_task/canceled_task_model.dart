import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'canceled_task_widget.dart' show CanceledTaskWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CanceledTaskModel extends FlutterFlowModel<CanceledTaskWidget> {
  ///  Local state fields for this page.

  String? observation;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ClientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  String? _clientNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'clientName is required';
    }

    return null;
  }

  // State field(s) for Observation widget.
  FocusNode? observationFocusNode;
  TextEditingController? observationTextController;
  String? Function(BuildContext, String?)? observationTextControllerValidator;
  String? _observationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Observation... is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (cancelTask)] action in Button widget.
  ApiCallResponse? apiResult4wc;

  @override
  void initState(BuildContext context) {
    clientNameTextControllerValidator = _clientNameTextControllerValidator;
    observationTextControllerValidator = _observationTextControllerValidator;
  }

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    observationFocusNode?.dispose();
    observationTextController?.dispose();
  }
}
