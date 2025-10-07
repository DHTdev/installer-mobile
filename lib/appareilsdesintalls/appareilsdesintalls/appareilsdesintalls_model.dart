import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appareilsdesintalls_widget.dart' show AppareilsdesintallsWidget;
import 'package:flutter/material.dart';

class AppareilsdesintallsModel
    extends FlutterFlowModel<AppareilsdesintallsWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
