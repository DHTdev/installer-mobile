// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// struct of reparation task
class ReparationInfoStruct extends BaseStruct {
  ReparationInfoStruct({
    /// all devices installed for target client
    List<InstalledDeviceStruct>? allDeviceInstalled,
    List<CarStruct>? vehicules,
  })  : _allDeviceInstalled = allDeviceInstalled,
        _vehicules = vehicules;

  // "allDeviceInstalled" field.
  List<InstalledDeviceStruct>? _allDeviceInstalled;
  List<InstalledDeviceStruct> get allDeviceInstalled =>
      _allDeviceInstalled ?? const [];
  set allDeviceInstalled(List<InstalledDeviceStruct>? val) =>
      _allDeviceInstalled = val;

  void updateAllDeviceInstalled(
      Function(List<InstalledDeviceStruct>) updateFn) {
    updateFn(_allDeviceInstalled ??= []);
  }

  bool hasAllDeviceInstalled() => _allDeviceInstalled != null;

  // "vehicules" field.
  List<CarStruct>? _vehicules;
  List<CarStruct> get vehicules => _vehicules ?? const [];
  set vehicules(List<CarStruct>? val) => _vehicules = val;

  void updateVehicules(Function(List<CarStruct>) updateFn) {
    updateFn(_vehicules ??= []);
  }

  bool hasVehicules() => _vehicules != null;

  static ReparationInfoStruct fromMap(Map<String, dynamic> data) =>
      ReparationInfoStruct(
        allDeviceInstalled: getStructList(
          data['allDeviceInstalled'],
          InstalledDeviceStruct.fromMap,
        ),
        vehicules: getStructList(
          data['vehicules'],
          CarStruct.fromMap,
        ),
      );

  static ReparationInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ReparationInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'allDeviceInstalled':
            _allDeviceInstalled?.map((e) => e.toMap()).toList(),
        'vehicules': _vehicules?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'allDeviceInstalled': serializeParam(
          _allDeviceInstalled,
          ParamType.DataStruct,
          isList: true,
        ),
        'vehicules': serializeParam(
          _vehicules,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ReparationInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReparationInfoStruct(
        allDeviceInstalled: deserializeStructParam<InstalledDeviceStruct>(
          data['allDeviceInstalled'],
          ParamType.DataStruct,
          true,
          structBuilder: InstalledDeviceStruct.fromSerializableMap,
        ),
        vehicules: deserializeStructParam<CarStruct>(
          data['vehicules'],
          ParamType.DataStruct,
          true,
          structBuilder: CarStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ReparationInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ReparationInfoStruct &&
        listEquality.equals(allDeviceInstalled, other.allDeviceInstalled) &&
        listEquality.equals(vehicules, other.vehicules);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([allDeviceInstalled, vehicules]);
}

ReparationInfoStruct createReparationInfoStruct() => ReparationInfoStruct();
