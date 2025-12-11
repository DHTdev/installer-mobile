import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_section_widget.dart';
import '/components/returned_devices_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appareilsdesintalls_widget.dart' show AppareilsdesintallsWidget;
import 'package:flutter/material.dart';

class AppareilsdesintallsModel
    extends FlutterFlowModel<AppareilsdesintallsWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  List<ReturnedDevicesStruct> returnedDevices = [];
  void addToReturnedDevices(ReturnedDevicesStruct item) =>
      returnedDevices.add(item);
  void removeFromReturnedDevices(ReturnedDevicesStruct item) =>
      returnedDevices.remove(item);
  void removeAtIndexFromReturnedDevices(int index) =>
      returnedDevices.removeAt(index);
  void insertAtIndexInReturnedDevices(int index, ReturnedDevicesStruct item) =>
      returnedDevices.insert(index, item);
  void updateReturnedDevicesAtIndex(
          int index, Function(ReturnedDevicesStruct) updateFn) =>
      returnedDevices[index] = updateFn(returnedDevices[index]);

  bool selected = false;

  List<int> selectedDevices = [];
  void addToSelectedDevices(int item) => selectedDevices.add(item);
  void removeFromSelectedDevices(int item) => selectedDevices.remove(item);
  void removeAtIndexFromSelectedDevices(int index) =>
      selectedDevices.removeAt(index);
  void insertAtIndexInSelectedDevices(int index, int item) =>
      selectedDevices.insert(index, item);
  void updateSelectedDevicesAtIndex(int index, Function(int) updateFn) =>
      selectedDevices[index] = updateFn(selectedDevices[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ReturnedDevices)] action in Appareilsdesintalls widget.
  ApiCallResponse? apiResultz7r;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Models for Returned_devices dynamic component.
  late FlutterFlowDynamicModels<ReturnedDevicesModel> returnedDevicesModels;
  // Stores action output result for [Backend Call - API (affecteDevices)] action in Button widget.
  ApiCallResponse? apiResultaf3;
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;

  @override
  void initState(BuildContext context) {
    returnedDevicesModels =
        FlutterFlowDynamicModels(() => ReturnedDevicesModel());
    headerSectionModel = createModel(context, () => HeaderSectionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    returnedDevicesModels.dispose();
    headerSectionModel.dispose();
  }
}
