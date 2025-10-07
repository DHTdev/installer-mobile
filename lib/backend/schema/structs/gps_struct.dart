// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GpsStruct extends BaseStruct {
  GpsStruct({
    String? serialNumber,
    String? nameModele,
    String? nameType,
    String? serialNumberCombination,
    int? relating,
    String? observation,
  })  : _serialNumber = serialNumber,
        _nameModele = nameModele,
        _nameType = nameType,
        _serialNumberCombination = serialNumberCombination,
        _relating = relating,
        _observation = observation;

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

  // "serial_numberCombination" field.
  String? _serialNumberCombination;
  String get serialNumberCombination => _serialNumberCombination ?? '';
  set serialNumberCombination(String? val) => _serialNumberCombination = val;

  bool hasSerialNumberCombination() => _serialNumberCombination != null;

  // "relating" field.
  int? _relating;
  int get relating => _relating ?? 0;
  set relating(int? val) => _relating = val;

  void incrementRelating(int amount) => relating = relating + amount;

  bool hasRelating() => _relating != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  static GpsStruct fromMap(Map<String, dynamic> data) => GpsStruct(
        serialNumber: data['serial_number'] as String?,
        nameModele: data['nameModele'] as String?,
        nameType: data['nameType'] as String?,
        serialNumberCombination: data['serial_numberCombination'] as String?,
        relating: castToType<int>(data['relating']),
        observation: data['observation'] as String?,
      );

  static GpsStruct? maybeFromMap(dynamic data) =>
      data is Map ? GpsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'serial_number': _serialNumber,
        'nameModele': _nameModele,
        'nameType': _nameType,
        'serial_numberCombination': _serialNumberCombination,
        'relating': _relating,
        'observation': _observation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'serial_numberCombination': serializeParam(
          _serialNumberCombination,
          ParamType.String,
        ),
        'relating': serializeParam(
          _relating,
          ParamType.int,
        ),
        'observation': serializeParam(
          _observation,
          ParamType.String,
        ),
      }.withoutNulls;

  static GpsStruct fromSerializableMap(Map<String, dynamic> data) => GpsStruct(
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
        serialNumberCombination: deserializeParam(
          data['serial_numberCombination'],
          ParamType.String,
          false,
        ),
        relating: deserializeParam(
          data['relating'],
          ParamType.int,
          false,
        ),
        observation: deserializeParam(
          data['observation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GpsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GpsStruct &&
        serialNumber == other.serialNumber &&
        nameModele == other.nameModele &&
        nameType == other.nameType &&
        serialNumberCombination == other.serialNumberCombination &&
        relating == other.relating &&
        observation == other.observation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        serialNumber,
        nameModele,
        nameType,
        serialNumberCombination,
        relating,
        observation
      ]);
}

GpsStruct createGpsStruct({
  String? serialNumber,
  String? nameModele,
  String? nameType,
  String? serialNumberCombination,
  int? relating,
  String? observation,
}) =>
    GpsStruct(
      serialNumber: serialNumber,
      nameModele: nameModele,
      nameType: nameType,
      serialNumberCombination: serialNumberCombination,
      relating: relating,
      observation: observation,
    );
