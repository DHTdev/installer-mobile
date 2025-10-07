// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SimStruct extends BaseStruct {
  SimStruct({
    int? id,
    String? serialNumber,
    String? nameModele,
    String? nameType,
    List<LatestDeviceRelatingStruct>? latestDeviceRelating,
  })  : _id = id,
        _serialNumber = serialNumber,
        _nameModele = nameModele,
        _nameType = nameType,
        _latestDeviceRelating = latestDeviceRelating;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "serial_number" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "nameModele" field.
  String? _nameModele;
  String get nameModele => _nameModele ?? '';
  set nameModele(String? val) => _nameModele = val;

  bool hasNameModele() => _nameModele != null;

  // "nameType" field.
  String? _nameType;
  String get nameType => _nameType ?? '';
  set nameType(String? val) => _nameType = val;

  bool hasNameType() => _nameType != null;

  // "latest_device_relating" field.
  List<LatestDeviceRelatingStruct>? _latestDeviceRelating;
  List<LatestDeviceRelatingStruct> get latestDeviceRelating =>
      _latestDeviceRelating ?? const [];
  set latestDeviceRelating(List<LatestDeviceRelatingStruct>? val) =>
      _latestDeviceRelating = val;

  void updateLatestDeviceRelating(
      Function(List<LatestDeviceRelatingStruct>) updateFn) {
    updateFn(_latestDeviceRelating ??= []);
  }

  bool hasLatestDeviceRelating() => _latestDeviceRelating != null;

  static SimStruct fromMap(Map<String, dynamic> data) => SimStruct(
        id: castToType<int>(data['id']),
        serialNumber: data['serial_number'] as String?,
        nameModele: data['nameModele'] as String?,
        nameType: data['nameType'] as String?,
        latestDeviceRelating: getStructList(
          data['latest_device_relating'],
          LatestDeviceRelatingStruct.fromMap,
        ),
      );

  static SimStruct? maybeFromMap(dynamic data) =>
      data is Map ? SimStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'serial_number': _serialNumber,
        'nameModele': _nameModele,
        'nameType': _nameType,
        'latest_device_relating':
            _latestDeviceRelating?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'serial_number': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'nameModele': serializeParam(
          _nameModele,
          ParamType.String,
        ),
        'nameType': serializeParam(
          _nameType,
          ParamType.String,
        ),
        'latest_device_relating': serializeParam(
          _latestDeviceRelating,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SimStruct fromSerializableMap(Map<String, dynamic> data) => SimStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        serialNumber: deserializeParam(
          data['serial_number'],
          ParamType.String,
          false,
        ),
        nameModele: deserializeParam(
          data['nameModele'],
          ParamType.String,
          false,
        ),
        nameType: deserializeParam(
          data['nameType'],
          ParamType.String,
          false,
        ),
        latestDeviceRelating:
            deserializeStructParam<LatestDeviceRelatingStruct>(
          data['latest_device_relating'],
          ParamType.DataStruct,
          true,
          structBuilder: LatestDeviceRelatingStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SimStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SimStruct &&
        id == other.id &&
        serialNumber == other.serialNumber &&
        nameModele == other.nameModele &&
        nameType == other.nameType &&
        listEquality.equals(latestDeviceRelating, other.latestDeviceRelating);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, serialNumber, nameModele, nameType, latestDeviceRelating]);
}

SimStruct createSimStruct({
  int? id,
  String? serialNumber,
  String? nameModele,
  String? nameType,
}) =>
    SimStruct(
      id: id,
      serialNumber: serialNumber,
      nameModele: nameModele,
      nameType: nameType,
    );
