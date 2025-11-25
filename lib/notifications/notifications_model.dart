import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  List<TechnicianTaskStruct> tasksNotifications = [];
  void addToTasksNotifications(TechnicianTaskStruct item) =>
      tasksNotifications.add(item);
  void removeFromTasksNotifications(TechnicianTaskStruct item) =>
      tasksNotifications.remove(item);
  void removeAtIndexFromTasksNotifications(int index) =>
      tasksNotifications.removeAt(index);
  void insertAtIndexInTasksNotifications(
          int index, TechnicianTaskStruct item) =>
      tasksNotifications.insert(index, item);
  void updateTasksNotificationsAtIndex(
          int index, Function(TechnicianTaskStruct) updateFn) =>
      tasksNotifications[index] = updateFn(tasksNotifications[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Tasks)] action in Notifications widget.
  ApiCallResponse? apiResultfhn;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
