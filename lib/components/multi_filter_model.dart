import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'multi_filter_widget.dart' show MultiFilterWidget;
import 'package:flutter/material.dart';

class MultiFilterModel extends FlutterFlowModel<MultiFilterWidget> {
  ///  Local state fields for this component.

  List<CityStruct> cities = [];
  void addToCities(CityStruct item) => cities.add(item);
  void removeFromCities(CityStruct item) => cities.remove(item);
  void removeAtIndexFromCities(int index) => cities.removeAt(index);
  void insertAtIndexInCities(int index, CityStruct item) =>
      cities.insert(index, item);
  void updateCitiesAtIndex(int index, Function(CityStruct) updateFn) =>
      cities[index] = updateFn(cities[index]);

  String? selectedTaskCategory;

  String? selectedCity;

  String? selectedDateFilter;

  int? selectedTaskStatus;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getAllCities)] action in Container widget.
  ApiCallResponse? apiResultCities;
  // State field(s) for CitiesDropDown widget.
  String? citiesDropDownValue;
  FormFieldController<String>? citiesDropDownValueController;
  // State field(s) for DateDropDpown widget.
  String? dateDropDpownValue;
  FormFieldController<String>? dateDropDpownValueController;
  // State field(s) for TaskTypeDropDown widget.
  String? taskTypeDropDownValue;
  FormFieldController<String>? taskTypeDropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
