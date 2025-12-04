// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarStruct extends BaseStruct {
  CarStruct({
    int? id,
    int? clientId,
    String? matricule,
    List<LatestDeviceRelatingStruct>? latestDeviceRelating,
  })  : _id = id,
        _clientId = clientId,
        _matricule = matricule,
        _latestDeviceRelating = latestDeviceRelating;
        



  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "clientId" field.
  int? _clientId;
  int get clientId => _clientId ?? 0;
  set clientId(int? val) => _clientId = val;

  void incrementClientId(int amount) => clientId = clientId + amount;

  bool hasClientId() => _clientId != null;

  // "matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

    // "latestDeviceRelating" field.
  List<LatestDeviceRelatingStruct>? _latestDeviceRelating;
  List<LatestDeviceRelatingStruct> get latestDeviceRelating =>
      _latestDeviceRelating ?? const [];
  set latestDeviceRelating(List<LatestDeviceRelatingStruct>? val) =>
      _latestDeviceRelating = val;

  static CarStruct fromMap(Map<String, dynamic> data) => CarStruct(
        id: castToType<int>(data['id']),
        clientId: castToType<int>(data['clientId']),
        matricule: data['matricule'] as String?,
        latestDeviceRelating: getStructList(
          data['articles'],
          (m) => LatestDeviceRelatingStruct.fromMap({...m})
,
        ),
      );

  static CarStruct? maybeFromMap(dynamic data) =>
      data is Map ? CarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'clientId': _clientId,
        'matricule': _matricule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'clientId': serializeParam(
          _clientId,
          ParamType.int,
        ),
        'matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarStruct fromSerializableMap(Map<String, dynamic> data) => CarStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        clientId: deserializeParam(
          data['clientId'],
          ParamType.int,
          false,
        ),
        matricule: deserializeParam(
          data['matricule'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarStruct &&
        id == other.id &&
        clientId == other.clientId &&
        matricule == other.matricule;
  }

  @override
  int get hashCode => const ListEquality().hash([id, clientId, matricule]);
}

CarStruct createCarStruct({
  int? id,
  int? clientId,
  String? matricule,
}) =>
    CarStruct(
      id: id,
      clientId: clientId,
      matricule: matricule,
    );
