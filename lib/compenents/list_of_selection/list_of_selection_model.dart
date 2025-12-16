import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_selection_widget.dart' show ListOfSelectionWidget;
import 'package:flutter/material.dart';

class ListOfSelectionModel extends FlutterFlowModel<ListOfSelectionWidget> {
  ///  Local state fields for this component.

  List<GpsStruct> imei = [];
  void addToImei(GpsStruct item) => imei.add(item);
  void removeFromImei(GpsStruct item) => imei.remove(item);
  void removeAtIndexFromImei(int index) => imei.removeAt(index);
  void insertAtIndexInImei(int index, GpsStruct item) =>
      imei.insert(index, item);
  void updateImeiAtIndex(int index, Function(GpsStruct) updateFn) =>
      imei[index] = updateFn(imei[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (appareils)] action in ListOfSelection widget.
  ApiCallResponse? apiResultupj;
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
