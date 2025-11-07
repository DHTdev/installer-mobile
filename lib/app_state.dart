import 'package:flutter/material.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  List <GpsStruct> _devicesGps = [];
  List <GpsStruct> get devicesGps => _devicesGps;
  set devicesGps(List <GpsStruct> value) {
    _devicesGps = value;
  }
  List <SimStruct> _devicesSim = [];
  List <SimStruct> get devicesSim => _devicesSim;
  set devicesSim(List <SimStruct> value) {
    _devicesSim = value;
  }
  List <AccessoryStruct> _devicesAccessory = [];
  List <AccessoryStruct> get devicesAccessory => _devicesAccessory;
  set devicesAccessory(List <AccessoryStruct> value) {
    _devicesAccessory = value;
  }

  dynamic _headerResponse;
  dynamic get headerResponse => _headerResponse;
  set headerResponse(dynamic value) {
    _headerResponse = value;
  }
}
