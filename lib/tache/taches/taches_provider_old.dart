import 'package:flutter/material.dart';
import 'package:mobile_installer/app_state.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/api_requests/api_manager.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/backend/schema/structs/installation_submit_struct.dart';
import 'package:mobile_installer/tache/taches/taches_model.dart' show TachesModel;

class TachesProvider extends ChangeNotifier {
  // list of technician tasks provided globally
  bool _isLoading = true;
  String? error;
  List<TechnicianTaskStruct> _technicianTasks = [];
  List<TechnicianTaskStruct> get technicianTasks => _technicianTasks;
    bool get isLoading => _isLoading;

  set technicianTasks(List<TechnicianTaskStruct> value) {
    _technicianTasks = value;
    notifyListeners();
  }

  // api call function to get all tasks

  Future<void> fetchAndSetTechnicianTasks() async {
    _isLoading = true;

    try {
      print("Fetching technician tasks...${isLoading}");

      final apiResult = await TechnicienGroup.tasksCall.call(FFAppState().authToken);
      _technicianTasks =
          ((apiResult.jsonBody ?? '').toList().map<TechnicianTaskStruct?>(TechnicianTaskStruct.maybeFromMap).toList() as Iterable<TechnicianTaskStruct?>).toList().cast<TechnicianTaskStruct>();
    } catch (e) {
      error = e.toString();
    } finally {
      print("Fetched ${_technicianTasks.length} technician tasks. ${isLoading}");
      _isLoading = false;
      notifyListeners();
    }
  }

  void addToTechnicianTasks(TechnicianTaskStruct item) {
    _technicianTasks.add(item);
  }

  void updateTaskFromTechnicianTasks(int index, InstallationSubmitStruct item) {
    _technicianTasks.where((task) => task.id == index).toList()[0].etatTache = 2;
    fetchAndSetTechnicianTasks();
    notifyListeners();
  }

  void removeAtIndexFromTechnicianTask(int index) {
    _technicianTasks.removeAt(index);
    notifyListeners();
  }

  // api call postponed function

  Future<void> callPostponed() async {
    await TechnicienGroup.tasksCall.call(FFAppState().authToken);
  }

  // end of call postponed function
}
