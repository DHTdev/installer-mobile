import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/exception_task_form_struct.dart';
import 'package:mobile_installer/backend/schema/structs/new_task_info_struct.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tcheexceptionnel_widget.dart' show TcheexceptionnelWidget;
import 'package:flutter/material.dart';

class TcheexceptionnelModel extends FlutterFlowModel<TcheexceptionnelWidget> {
  ///  Local state fields for this page.

  String? nomComplet;

  String? typeTache;

  String? date;

  String? affecte;

  String? typeSim;

  String? description;

  String? telephone;

  int? quantite = 1;

  String? clientCity;

  ///  State fields for stateful widgets in this page.
  List<ExceptionTaskFormStruct> exceptionTasksInfo = [];
  NewTaskInfoStruct? newTaskInfo;
  ApiCallResponse? apiResponseNewTaskInfo;
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusClientName;
  TextEditingController? textControllerClientName;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget for phone number.
  FocusNode? textFieldFocusPhoneNumber;
  TextEditingController? textControllerPhoneNumber;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  DateTime? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget for quantite.
  FocusNode? textFieldFocusQuantite;
  TextEditingController? textControllerQuantite;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget for city.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownValueCityController;
  // State field(s) for DropDown widget for type task.
  String? dropDownTypeTaskValue;
  FormFieldController<String>? dropDownTypeTaskValueValueController;
  // State field(s) for TextField widget for description.
  FocusNode? textFieldFocusDescription;
  TextEditingController? textControllerDescription;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusClientName?.dispose();
    textControllerClientName?.dispose();

    textFieldFocusPhoneNumber?.dispose();
    textControllerPhoneNumber?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();


    textFieldFocusQuantite?.dispose();
    textControllerQuantite?.dispose();

    textFieldFocusDescription?.dispose();
    textControllerDescription?.dispose();
  }
}