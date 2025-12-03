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

  String? searchText = '';

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

  List<CityStruct> cities = [];
  void addToCities(CityStruct item) => cities.add(item);
  void removeFromCities(CityStruct item) => cities.remove(item);
  void removeAtIndexFromCities(int index) => cities.removeAt(index);
  void insertAtIndexInCities(int index, CityStruct item) =>
      cities.insert(index, item);
  void updateCitiesAtIndex(int index, Function(CityStruct) updateFn) =>
      cities[index] = updateFn(cities[index]);

  String? selectedCity;

  String? selectedDateFilter;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Tasks)] action in Taches widget.
  ApiCallResponse? apiResultTechnianTasks;
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;
  // Stores action output result for [Backend Call - API (getInfo)] action in Container widget.
  ApiCallResponse? citiesResp;
  // State field(s) for SelectCitiesDD widget.
  String? selectCitiesDDValue;
  FormFieldController<String>? selectCitiesDDValueController;
  // State field(s) for SelectDateDD widget.
  String? selectDateDDValue;
  FormFieldController<String>? selectDateDDValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for TechnicienTasks dynamic component.
  late FlutterFlowDynamicModels<TechnicienTasksModel> technicienTasksModels;

  @override
  void initState(BuildContext context) {
    headerSectionModel = createModel(context, () => HeaderSectionModel());
    technicienTasksModels =
        FlutterFlowDynamicModels(() => TechnicienTasksModel());
  }

  @override
  void dispose() {
    headerSectionModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    technicienTasksModels.dispose();
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
