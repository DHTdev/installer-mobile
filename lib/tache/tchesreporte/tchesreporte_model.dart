import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tchesreporte_widget.dart' show TchesreporteWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TchesreporteModel extends FlutterFlowModel<TchesreporteWidget> {
  ///  Local state fields for this page.

  DateTime? sectedDateFromBtn;

  String? observation;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DateSitter widget.
  FocusNode? dateSitterFocusNode;
  TextEditingController? dateSitterTextController;
  String? Function(BuildContext, String?)? dateSitterTextControllerValidator;
  String? _dateSitterTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for observation widget.
  FocusNode? observationFocusNode;
  TextEditingController? observationTextController;
  String? Function(BuildContext, String?)? observationTextControllerValidator;
  String? _observationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Observation is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (postponeTask)] action in Button widget.
  ApiCallResponse? actionTP;

  @override
  void initState(BuildContext context) {
    dateSitterTextControllerValidator = _dateSitterTextControllerValidator;
    observationTextControllerValidator = _observationTextControllerValidator;
  }

  @override
  void dispose() {
    dateSitterFocusNode?.dispose();
    dateSitterTextController?.dispose();

    observationFocusNode?.dispose();
    observationTextController?.dispose();
  }
}
