import 'dart:async';

import 'package:mobile_installer/backend/api_requests/api_manager.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/compenents/taskToConfirmed/task_to_confirmed_item_model.dart';

import '/components/header_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tacheconfirmer_widget.dart' show TacheconfirmerWidget;
import 'package:flutter/material.dart';

class TacheconfirmerModel extends FlutterFlowModel<TacheconfirmerWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ApiCallResponse? apiResponseAllConfirmedTask;
  Completer<ApiCallResponse>? apiRequestCompleterAllConfirmedTask;
  List<TechnicianTaskStruct> tasksToConfirmed = [];

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;
  late TaskToConfirmedItemModel taskToConfirmedItemModel;

  @override
  void initState(BuildContext context) {
    taskToConfirmedItemModel = createModel(context, () => TaskToConfirmedItemModel());
    headerSectionModel = createModel(context, () => HeaderSectionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    headerSectionModel.dispose();
  }
}
