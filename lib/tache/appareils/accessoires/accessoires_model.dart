import '/components/accesory_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accessoires_widget.dart' show AccessoiresWidget;
import 'package:flutter/material.dart';

class AccessoiresModel extends FlutterFlowModel<AccessoiresWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for accesoryItem component.
  late AccesoryItemModel accesoryItemModel;

  @override
  void initState(BuildContext context) {
    accesoryItemModel = createModel(context, () => AccesoryItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    accesoryItemModel.dispose();
  }
}
