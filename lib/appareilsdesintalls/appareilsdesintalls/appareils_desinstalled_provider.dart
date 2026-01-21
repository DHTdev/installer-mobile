import 'package:flutter/material.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/returned_devices_struct.dart';
import 'package:mobile_installer/flutter_flow/flutter_flow_util.dart';

class AppareilsDesinstalledProvider extends ChangeNotifier {
  /// Initialization and disposal methods.
  List<ReturnedDevicesStruct> _returnedDevices = [];
  List<int> _selectedDevices = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<ReturnedDevicesStruct> get returnedDevices => _returnedDevices;
  List<int> get selectedDevices => _selectedDevices;

  void initState(BuildContext context) {
    // Initialization logic here.
  }

  Future<void> loadReturnedDevices() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await TechnicienGroup.returnedDevicesCall.call();
      print("response: ${response.jsonBody}");
      if (response.succeeded) {
        _returnedDevices = ((response.jsonBody ?? '').toList().map<ReturnedDevicesStruct?>(ReturnedDevicesStruct.maybeFromMap).toList() as Iterable<ReturnedDevicesStruct?>)
            .withoutNulls
            .toList()
            .cast<ReturnedDevicesStruct>();
      } else {
        _errorMessage = 'Erreur lors du chargement des appareils désinstallés';
      }
    } catch (e) {
      _errorMessage = 'Erreur lors du chargement des appareils désinstallés';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addToSelectedDevices(int item) {
    _returnedDevices.where((element) => element.id == item).toList()[0].is_selected = true;
    _selectedDevices.add(item);
  }

  void removeFromSelectedDevices(int item) {
    _returnedDevices.where((element) => element.id == item).toList()[0].is_selected = false;
    _selectedDevices.remove(item);
  }

  void removeAtIndexFromSelectedDevices() {
    _returnedDevices.removeWhere((item) => _selectedDevices.contains(item.id));
    _selectedDevices.clear();
    print("selectedDevices after clear: $_returnedDevices");
    notifyListeners();
  }
}
