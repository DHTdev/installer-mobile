import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'authentification_widget.dart' show AuthentificationWidget;
import 'package:flutter/material.dart';

class AuthentificationModel extends FlutterFlowModel<AuthentificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (XSRF TOKEN)] action in Button widget.
  ApiCallResponse? apiResult7dx;
  // Stores action output result for [Backend Call - API (login)] action in Button widget.
  ApiCallResponse? apiLoginResponse;

    late bool passwordVisibility;


  String? userName;
  String? password;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
