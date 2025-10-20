import '/components/sim_device_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sim_widget.dart' show SimWidget;
import 'package:flutter/material.dart';

class SimModel extends FlutterFlowModel<SimWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for simDeviceItem component.
  late SimDeviceItemModel simDeviceItemModel;

  @override
  void initState(BuildContext context) {
    simDeviceItemModel = createModel(context, () => SimDeviceItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    simDeviceItemModel.dispose();
  }
}
