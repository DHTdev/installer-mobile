import '/components/header_section_widget.dart';
import '/components/task_to_confirmed_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tacheconfirmer_widget.dart' show TacheconfirmerWidget;
import 'package:flutter/material.dart';

class TacheconfirmerModel extends FlutterFlowModel<TacheconfirmerWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for taskToConfirmedItem component.
  late TaskToConfirmedItemModel taskToConfirmedItemModel;
  // Model for headerSection component.
  late HeaderSectionModel headerSectionModel;

  @override
  void initState(BuildContext context) {
    taskToConfirmedItemModel =
        createModel(context, () => TaskToConfirmedItemModel());
    headerSectionModel = createModel(context, () => HeaderSectionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    taskToConfirmedItemModel.dispose();
    headerSectionModel.dispose();
  }
}
