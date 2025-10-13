import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compenents/technicien_tasks/technicien_tasks_widget.dart';
import '/components/header_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'taches_widget.dart' show TachesWidget;
import 'package:flutter/material.dart';

class TachesModel extends FlutterFlowModel<TachesWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  String searchText = '\"\"';

  String selectedStatus = '\"\"';

  List<TechnicianTaskStruct> technicianTask = [];
  void addToTechnicianTask(TechnicianTaskStruct item) =>
      technicianTask.add(item);
  void removeFromTechnicianTask(TechnicianTaskStruct item) =>
      technicianTask.remove(item);
  void removeAtIndexFromTechnicianTask(int index) =>
      technicianTask.removeAt(index);
  void insertAtIndexInTechnicianTask(int index, TechnicianTaskStruct item) =>
      technicianTask.insert(index, item);
  void updateTechnicianTaskAtIndex(
          int index, Function(TechnicianTaskStruct) updateFn) =>
      technicianTask[index] = updateFn(technicianTask[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Tasks)] action in Taches widget.
  ApiCallResponse? apiResultTechnianTasks;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for TechnicienTasks dynamic component.
  late FlutterFlowDynamicModels<TechnicienTasksModel> technicienTasksModels;
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;

  @override
  void initState(BuildContext context) {
    technicienTasksModels =
        FlutterFlowDynamicModels(() => TechnicienTasksModel());
    headerSectionModel = createModel(context, () => HeaderSectionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    technicienTasksModels.dispose();
    headerSectionModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
