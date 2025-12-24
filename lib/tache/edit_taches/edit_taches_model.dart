import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_manager.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
// 
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'edit_taches_widget.dart' show EditTachesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTachesModel extends FlutterFlowModel<EditTachesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Completer<ApiCallResponse>? apiResponseCompleter;
  ApiCallResponse? apiResultGetDevicesByTech;
  ApiCallResponse? apiResponseTaskInfo;
  NewTaskInfoStruct? newTaskInfo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeClientName;
  TextEditingController? textControllerClientName;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeMatricule;
  TextEditingController? textControllerMatricule;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeIMEI;
  TextEditingController? textControllerIMEI;
  int? Function(BuildContext, int?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeDeviceType;
  TextEditingController? textControllerDeviceType;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for GPS_Position widget.
  String? gPSPositionValue1;
  FormFieldController<String>? gPSPositionValueController1;
  // State field(s) for GPS_Position widget.
  String? gPSPositionValue2;
  FormFieldController<String>? gPSPositionValueController2;
  // State field(s) for type_relais widget.
  String? typeRelaisValue;
  FormFieldController<String>? typeRelaisValueController;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeDate;
  TextEditingController? textControllerDate;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNodeDescription;
  TextEditingController? textControllerDescription;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNodeClientName?.dispose();
    textControllerClientName?.dispose();

    textFieldFocusNodeMatricule?.dispose();
    textControllerMatricule?.dispose();

    textFieldFocusNodeIMEI?.dispose();
    textControllerIMEI?.dispose();

    textFieldFocusNodeDeviceType?.dispose();
    textControllerDeviceType?.dispose();

    textFieldFocusNodeDate?.dispose();
    textControllerDate?.dispose();

    textFieldFocusNodeDescription?.dispose();
    textControllerDescription?.dispose();
  }
}
