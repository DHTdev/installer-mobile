import 'package:mobile_installer/tache/taches/taches_provider_old.dart';

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

class TachesModel extends FlutterFlowModel<TachesWidget> with ChangeNotifier {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  String? searchText = null;

  String selectedStatus = '\"\"';

  // List of TechnicianTaskStruct for technicianTask.
  void addToTechnicianTask(TechnicianTaskStruct item) => TachesProvider().technicianTasks.add(item);
  void removeFromTechnicianTask(TechnicianTaskStruct item) => TachesProvider().technicianTasks.remove(item);


  void insertAtIndexInTechnicianTask(int index, TechnicianTaskStruct item) => TachesProvider().technicianTasks.insert(index, item);
  void updateTechnicianTaskAtIndex(int index, Function(TechnicianTaskStruct) updateFn) => TachesProvider().technicianTasks[index] = updateFn(TachesProvider().technicianTasks[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Tasks)] action in Taches widget.
  ApiCallResponse? apiResultTechnianTasks;
  List<CityStruct> citiesResponse = [];
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  String? selectedDateFilter;

  String? selectedCity;

  // State field(s) for SelectCitiesDD widget.
  String? selectCitiesDDValue;
  FormFieldController<String>? selectCitiesDDValueController;
  // State field(s) for SelectDateDD widget.
  String? selectDateDDValue;
  FormFieldController<String>? selectDateDDValueController;
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
    technicienTasksModels = FlutterFlowDynamicModels(() => TechnicienTasksModel());
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
