import 'package:mobile_installer/backend/schema/structs/reutned_devices_struct.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_section_widget.dart';
import '/components/returned_devices_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'appareilsdesintalls_widget.dart' show AppareilsdesintallsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

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

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for Returned_devices component.
  late ReturnedDevicesModel returnedDevicesModel;
  // Stores action output result for [Backend Call - API (Tasks)] action in Returned_devices widget.
  ApiCallResponse? apiResult8o1;
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;

  @override
  void initState(BuildContext context) {
    returnedDevicesModel = createModel(context, () => ReturnedDevicesModel());
    headerSectionModel = createModel(context, () => HeaderSectionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    returnedDevicesModel.dispose();
    headerSectionModel.dispose();
  }
}
