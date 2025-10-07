// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccessoryStruct extends BaseStruct {
  AccessoryStruct({
    String? serialNumber,
    String? nameModele,
    String? nameType,
  })  : _serialNumber = serialNumber,
        _nameModele = nameModele,
        _nameType = nameType;

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

  static AccessoryStruct fromMap(Map<String, dynamic> data) => AccessoryStruct(
        serialNumber: data['serial_number'] as String?,
        nameModele: data['nameModele'] as String?,
        nameType: data['nameType'] as String?,
      );

  static AccessoryStruct? maybeFromMap(dynamic data) => data is Map
      ? AccessoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'serial_number': _serialNumber,
        'nameModele': _nameModele,
        'nameType': _nameType,
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
      }.withoutNulls;

  static AccessoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      AccessoryStruct(
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
      );

  @override
  String toString() => 'AccessoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccessoryStruct &&
        serialNumber == other.serialNumber &&
        nameModele == other.nameModele &&
        nameType == other.nameType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([serialNumber, nameModele, nameType]);
}

AccessoryStruct createAccessoryStruct({
  String? serialNumber,
  String? nameModele,
  String? nameType,
}) =>
    AccessoryStruct(
      serialNumber: serialNumber,
      nameModele: nameModele,
      nameType: nameType,
    );
