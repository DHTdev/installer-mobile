import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panne_g_p_s_widget.dart' show PanneGPSWidget;
import 'package:flutter/material.dart';

class PanneGPSModel extends FlutterFlowModel<PanneGPSWidget> {
  ///  Local state fields for this page.

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
  // State field(s) for ClientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  // State field(s) for IMEI widget.
  FocusNode? imeiFocusNode;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  // State field(s) for NewIMEI widget.
  final newIMEIKey = GlobalKey();
  FocusNode? newIMEIFocusNode;
  TextEditingController? newIMEITextController;
  String? newIMEISelectedOption;
  String? Function(BuildContext, String?)? newIMEITextControllerValidator;
  // State field(s) for Matricule widget.
  FocusNode? matriculeFocusNode;
  TextEditingController? matriculeTextController;
  String? Function(BuildContext, String?)? matriculeTextControllerValidator;
  // State field(s) for NumSIM widget.
  FocusNode? numSIMFocusNode;
  TextEditingController? numSIMTextController;
  String? Function(BuildContext, String?)? numSIMTextControllerValidator;
  // State field(s) for Endroit widget.
  String? endroitValue;
  FormFieldController<String>? endroitValueController;
  // State field(s) for GPSPosition widget.
  String? gPSPositionValue;
  FormFieldController<String>? gPSPositionValueController;
  // State field(s) for TypeRelais widget.
  String? typeRelaisValue;
  FormFieldController<String>? typeRelaisValueController;
  bool isDataUploading_taskMedia = false;
  List<FFUploadedFile> uploadedLocalFiles_taskMedia = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    imeiFocusNode?.dispose();
    imeiTextController?.dispose();

    newIMEIFocusNode?.dispose();

    matriculeFocusNode?.dispose();
    matriculeTextController?.dispose();

    numSIMFocusNode?.dispose();
    numSIMTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
