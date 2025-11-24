import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'canceled_task_widget.dart' show CanceledTaskWidget;
import 'package:flutter/material.dart';

class CanceledTaskModel extends FlutterFlowModel<CanceledTaskWidget> {
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
  ApiCallResponse? apiResult50k;

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
