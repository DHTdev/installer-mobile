import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendrier_widget.dart' show CalendrierWidget;
import 'package:flutter/material.dart';

class CalendrierModel extends FlutterFlowModel<CalendrierWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  List<dynamic> taskList = [];
  void addToTaskList(dynamic item) => taskList.add(item);
  void removeFromTaskList(dynamic item) => taskList.remove(item);
  void removeAtIndexFromTaskList(int index) => taskList.removeAt(index);
  void insertAtIndexInTaskList(int index, dynamic item) =>
      taskList.insert(index, item);
  void updateTaskListAtIndex(int index, Function(dynamic) updateFn) =>
      taskList[index] = updateFn(taskList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
