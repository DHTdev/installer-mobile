// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// last gps combinated with sim
class LatestDeviceCombinationStruct extends BaseStruct {
  LatestDeviceCombinationStruct({
    int? id,
    double? state,
    bool? garantie,
    bool? gpsPricipale,
    int? serialNumber,
  })  : _id = id,
        _state = state,
        _garantie = garantie,
        _gpsPricipale = gpsPricipale,
        _serialNumber = serialNumber;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "state" field.
  double? _state;
  double get state => _state ?? 0.0;
  set state(double? val) => _state = val;

  void incrementState(double amount) => state = state + amount;

  bool hasState() => _state != null;

  // "garantie" field.
  bool? _garantie;
  bool get garantie => _garantie ?? false;
  set garantie(bool? val) => _garantie = val;

  bool hasGarantie() => _garantie != null;

  // "gpsPricipale" field.
  bool? _gpsPricipale;
  bool get gpsPricipale => _gpsPricipale ?? false;
  set gpsPricipale(bool? val) => _gpsPricipale = val;

  bool hasGpsPricipale() => _gpsPricipale != null;

  // "serialNumber" field.
  int? _serialNumber;
  int get serialNumber => _serialNumber ?? 0;
  set serialNumber(int? val) => _serialNumber = val;

  void incrementSerialNumber(int amount) =>
      serialNumber = serialNumber + amount;

  bool hasSerialNumber() => _serialNumber != null;

  static LatestDeviceCombinationStruct fromMap(Map<String, dynamic> data) =>
      LatestDeviceCombinationStruct(
        id: castToType<int>(data['id']),
        state: castToType<double>(data['state']),
        garantie: data['garantie'] as bool?,
        gpsPricipale: data['gpsPricipale'] as bool?,
        serialNumber: castToType<int>(data['serialNumber']),
      );

  static LatestDeviceCombinationStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? LatestDeviceCombinationStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'state': _state,
        'garantie': _garantie,
        'gpsPricipale': _gpsPricipale,
        'serialNumber': _serialNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'state': serializeParam(
          _state,
          ParamType.double,
        ),
        'garantie': serializeParam(
          _garantie,
          ParamType.bool,
        ),
        'gpsPricipale': serializeParam(
          _gpsPricipale,
          ParamType.bool,
        ),
        'serialNumber': serializeParam(
          _serialNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static LatestDeviceCombinationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LatestDeviceCombinationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.double,
          false,
        ),
        garantie: deserializeParam(
          data['garantie'],
          ParamType.bool,
          false,
        ),
        gpsPricipale: deserializeParam(
          data['gpsPricipale'],
          ParamType.bool,
          false,
        ),
        serialNumber: deserializeParam(
          data['serialNumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LatestDeviceCombinationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LatestDeviceCombinationStruct &&
        id == other.id &&
        state == other.state &&
        garantie == other.garantie &&
        gpsPricipale == other.gpsPricipale &&
        serialNumber == other.serialNumber;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, state, garantie, gpsPricipale, serialNumber]);
}

LatestDeviceCombinationStruct createLatestDeviceCombinationStruct({
  int? id,
  double? state,
  bool? garantie,
  bool? gpsPricipale,
  int? serialNumber,
}) =>
    LatestDeviceCombinationStruct(
      id: id,
      state: state,
      garantie: garantie,
      gpsPricipale: gpsPricipale,
      serialNumber: serialNumber,
    );
