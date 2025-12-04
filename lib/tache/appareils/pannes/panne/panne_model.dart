import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'panne_widget.dart' show PanneWidget;
import 'package:flutter/material.dart';

class PanneModel extends FlutterFlowModel<PanneWidget> {
  ///  Local state fields for this page.

  String? selectOption;

  List<String> uploadedImagesURLs = [];
  void addToUploadedImagesURLs(String item) => uploadedImagesURLs.add(item);
  void removeFromUploadedImagesURLs(String item) =>
      uploadedImagesURLs.remove(item);
  void removeAtIndexFromUploadedImagesURLs(int index) =>
      uploadedImagesURLs.removeAt(index);
  void insertAtIndexInUploadedImagesURLs(int index, String item) =>
      uploadedImagesURLs.insert(index, item);
  void updateUploadedImagesURLsAtIndex(int index, Function(String) updateFn) =>
      uploadedImagesURLs[index] = updateFn(uploadedImagesURLs[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading_taskMedia = false;
  List<FFUploadedFile> uploadedLocalFiles_taskMedia = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - API (panneTask)] action in Button widget.
  ApiCallResponse? apiResulto6y;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
