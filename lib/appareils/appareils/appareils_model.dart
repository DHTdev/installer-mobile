
import 'package:mobile_installer/compenents/appareils/number_device_model.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appareils_widget.dart' show AppareilsWidget;
import 'package:flutter/material.dart';

class AppareilsModel extends FlutterFlowModel<AppareilsWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  // Map<String, dynamic> technicianDevices = {};
  // // void addToTechnicianDevices(DeviceStruct item) => technicianDevices.add(item);
  // void removeFromTechnicianDevices(DeviceStruct item) =>
  //     technicianDevices.remove(item);
  // void removeAtIndexFromTechnicianDevices(int index) =>
  //     technicianDevices.removeAt(index);
  // void insertAtIndexInTechnicianDevices(int index, DeviceStruct item) =>
  //     technicianDevices.insert(index, item);
  // void updateTechnicianDevicesAtIndex(
  //         int index, Function(DeviceStruct) updateFn) =>
  //     technicianDevices[index] = updateFn(technicianDevices[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (appareils)] action in Appareils widget.
  ApiCallResponse? apiResultwi6;
  // Model for NumberDevice component.
  late NumberDeviceModel numberDeviceModel1;
  // Model for NumberDevice component.
  late NumberDeviceModel numberDeviceModel2;
  // Model for NumberDevice component.
  late NumberDeviceModel numberDeviceModel3;

  @override
  void initState(BuildContext context) {
    numberDeviceModel1 = createModel(context, () => NumberDeviceModel());
    numberDeviceModel2 = createModel(context, () => NumberDeviceModel());
    numberDeviceModel3 = createModel(context, () => NumberDeviceModel());
  }

  @override
  void dispose() {
    numberDeviceModel1.dispose();
    numberDeviceModel2.dispose();
    numberDeviceModel3.dispose();
  }
}
