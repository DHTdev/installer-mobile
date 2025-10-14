// ignore_for_file: unnecessary_getters_setters


import 'package:mobile_installer/backend/schema/structs/accessory_struct.dart';
import 'package:mobile_installer/backend/schema/structs/gps_struct.dart';
import 'package:mobile_installer/backend/schema/structs/sim_struct.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceStruct extends BaseStruct {
  DeviceStruct({
    int? numberGps,
    int? numberSim,
    int? numberAccessory,
    List<GpsStruct>? gps,
    List<SimStruct>? sim,
    List<AccessoryStruct>? accessory,
  })  : _numberGps = numberGps,
        _numberSim = numberSim,
        _numberAccessory = numberAccessory,
        _gps = gps,
        _sim = sim,
        _accessory = accessory;

  // "NumberGps" field.
  int? _numberGps;
  int get numberGps => _numberGps ?? 0;
  set numberGps(int? val) => _numberGps = val;

  bool hasNumberGps() => _numberGps != null;

  // "NumberSim" field.
  int? _numberSim;
  int get numberSim => _numberSim ?? 0;
  set numberSim(int? val) => _numberSim = val;

  bool hasNumberSim() => _numberSim != null;

  // "numberAccessory" field.
  int? _numberAccessory;
  int get numberAccessory => _numberAccessory ?? 0;
  set numberAccessory(int? val) => _numberAccessory = val;

  bool hasNumberAccessory() => _numberAccessory != null;

  // "GPS" field.
  List<GpsStruct>? _gps;
  List<GpsStruct> get gps => _gps ?? const [];
  set gps(List<GpsStruct>? val) => _gps = val;

  void updateGps(Function(List<GpsStruct>) updateFn) {
    updateFn(_gps ??= []);
  }

  bool hasGps() => _gps != null;

  // "SIM" field.
  List<SimStruct>? _sim;
  List<SimStruct> get sim => _sim ?? const [];
  set sim(List<SimStruct>? val) => _sim = val;

  void updateSim(Function(List<SimStruct>) updateFn) {
    updateFn(_sim ??= []);
  }

  bool hasSim() => _sim != null;

  // "Accessory" field.
  List<AccessoryStruct>? _accessory;
  List<AccessoryStruct> get accessory => _accessory ?? const [];
  set accessory(List<AccessoryStruct>? val) => _accessory = val;

  void updateAccessory(Function(List<AccessoryStruct>) updateFn) {
    updateFn(_accessory ??= []);
  }

  bool hasAccessory() => _accessory != null;

  static DeviceStruct fromMap(Map<String, dynamic> data) => DeviceStruct(
        numberGps: data['NumberGps'],
        numberSim: data['NumberSim'],
        numberAccessory: data['numberAccessory'],
        gps: getStructList(
          data['GPS'],
          GpsStruct.fromMap,
        ),
        sim: getStructList(
          data['SIM'],
          SimStruct.fromMap,
        ),
        accessory: getStructList(
          data['Accessory'],
          AccessoryStruct.fromMap,
        ),
      );

  static DeviceStruct? maybeFromMap(dynamic data) =>
      data is Map ? DeviceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'NumberGps': _numberGps,
        'NumberSim': _numberSim,
        'numberAccessory': _numberAccessory,
        'GPS': _gps?.map((e) => e.toMap()).toList(),
        'SIM': _sim?.map((e) => e.toMap()).toList(),
        'Accessory': _accessory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NumberGps': serializeParam(
          _numberGps,
          ParamType.String,
        ),
        'NumberSim': serializeParam(
          _numberSim,
          ParamType.String,
        ),
        'numberAccessory': serializeParam(
          _numberAccessory,
          ParamType.String,
        ),
        'GPS': serializeParam(
          _gps,
          ParamType.DataStruct,
          isList: true,
        ),
        'SIM': serializeParam(
          _sim,
          ParamType.DataStruct,
          isList: true,
        ),
        'Accessory': serializeParam(
          _accessory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceStruct(
        numberGps: deserializeParam(
          data['NumberGps'],
          ParamType.String,
          false,
        ),
        numberSim: deserializeParam(
          data['NumberSim'],
          ParamType.String,
          false,
        ),
        numberAccessory: deserializeParam(
          data['numberAccessory'],
          ParamType.String,
          false,
        ),
        gps: deserializeStructParam<GpsStruct>(
          data['GPS'],
          ParamType.DataStruct,
          true,
          structBuilder: GpsStruct.fromSerializableMap,
        ),
        sim: deserializeStructParam<SimStruct>(
          data['SIM'],
          ParamType.DataStruct,
          true,
          structBuilder: SimStruct.fromSerializableMap,
        ),
        accessory: deserializeStructParam<AccessoryStruct>(
          data['Accessory'],
          ParamType.DataStruct,
          true,
          structBuilder: AccessoryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceStruct &&
        numberGps == other.numberGps &&
        numberSim == other.numberSim &&
        numberAccessory == other.numberAccessory &&
        listEquality.equals(gps, other.gps) &&
        listEquality.equals(sim, other.sim) &&
        listEquality.equals(accessory, other.accessory);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([numberGps, numberSim, numberAccessory, gps, sim, accessory]);
}

DeviceStruct createDeviceStruct({
  int? numberGps,
  int? numberSim,
  int? numberAccessory,
}) =>
    DeviceStruct(
      numberGps: numberGps,
      numberSim: numberSim,
      numberAccessory: numberAccessory,
    );