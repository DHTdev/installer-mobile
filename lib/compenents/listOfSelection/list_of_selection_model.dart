import 'dart:async';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'list_of_selection_widget.dart' show ListOfSelectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfSelectionModel extends FlutterFlowModel<ListOfSelectionWidget> {
  ///  Local state fields for this component.

  List<SimStruct> sims = [];
  // void addToImei(GpsStruct item) => imei.add(item);
  // void removeFromImei(GpsStruct item) => imei.remove(item);
  // void removeAtIndexFromImei(int index) => imei.removeAt(index);
  // void insertAtIndexInImei(int index, GpsStruct item) =>
  //     imei.insert(index, item);
  // void updateImeiAtIndex(int index, Function(GpsStruct) updateFn) =>
  //     imei[index] = updateFn(imei[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (appareils)] action in ListOfSelection widget.
  ApiCallResponse? apiResultupj;
  Completer<ApiCallResponse>? apiResponseCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
