import 'package:flutter/foundation.dart';
import 'package:mobile_installer/backend/schema/structs/installation_submit_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class TachesProvider extends ChangeNotifier {
  // État
  List<TechnicianTaskStruct> _technicianTasks = [];
  List<CityStruct> _cities = [];
  String? _selectedCity;
  String? _selectedDateFilter;
  String _searchText = '';
  bool _isLoading = false;
  String? _error;

  // Getters
  List<TechnicianTaskStruct> get technicianTasks => _technicianTasks;
  List<String> get cityNames => ['Toutes les villes', ..._cities.map((e) => e.cityName)];
  String? get selectedCity => _selectedCity;
  String? get selectedDateFilter => _selectedDateFilter;
  String get searchText => _searchText;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Tâches filtrées
  List<TechnicianTaskStruct> get filteredTasks {
    final filtered = functions.filterTasks(
      _technicianTasks,
      _selectedCity,
      _selectedDateFilter,
      _searchText,
    );
    return filtered ?? [];
  }

  // Setters
  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setSelectedDateFilter(String? dateFilter) {
    _selectedDateFilter = dateFilter;
    notifyListeners();
  }

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  // Méthodes API
  Future<void> loadTasks(String authToken) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await TechnicienGroup.tasksCall.call(authToken);

      if (response.succeeded) {
        _technicianTasks =
            (response.jsonBody?.toList().map<TechnicianTaskStruct?>(TechnicianTaskStruct.maybeFromMap).toList() as Iterable<TechnicianTaskStruct?>).withoutNulls.toList().cast<TechnicianTaskStruct>();
      } else {
        _error = 'Erreur lors du chargement des tâches';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadCities() async {
    try {
      final response = await GetAllCitiesCall.call();

      if (response.succeeded) {
        _cities = (response.jsonBody?.toList().map<CityStruct?>(CityStruct.maybeFromMap).toList() as Iterable<CityStruct?>).withoutNulls.toList().cast<CityStruct>();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Erreur chargement villes: $e');
    }
  }

  Future<void> refreshTasks(String authToken) async {
    await loadTasks(authToken);
  }

  void reset() {
    _selectedCity = null;
    _selectedDateFilter = null;
    _searchText = '';
    notifyListeners();
  }

  // // api call postponed function

  // Future<ApiCallResponse> callPostponed(taskId, newDate, obsirvation) async {
  //   final response = await await TechnicienGroup.postponeTaskCall.call(
  //     id: taskId,
  //     NouvelleDate: newDate,
  //     observation: obsirvation,
  //   );
  //   notifyListeners();
  //   return response;
  // }
  // // end of call postponed function

  void updateTaskFromTechnicianTasks(int index, int etatTask) {
    _technicianTasks.where((task) => task.id == index).toList()[0].etatTache = etatTask;
    loadTasks(FFAppState().authToken);
    notifyListeners();
  }


}
