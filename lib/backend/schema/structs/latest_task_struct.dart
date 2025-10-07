// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// latest task who created by commercial
class LatestTaskStruct extends BaseStruct {
  LatestTaskStruct({
    int? id,
    int? clientId,
    int? userId,
    int? subUserId,
    DateTime? createdAt,
    String? clientName,
  })  : _id = id,
        _clientId = clientId,
        _userId = userId,
        _subUserId = subUserId,
        _createdAt = createdAt,
        _clientName = clientName;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "client_id" field.
  int? _clientId;
  int get clientId => _clientId ?? 0;
  set clientId(int? val) => _clientId = val;

  void incrementClientId(int amount) => clientId = clientId + amount;

  bool hasClientId() => _clientId != null;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "subUserId" field.
  int? _subUserId;
  int get subUserId => _subUserId ?? 0;
  set subUserId(int? val) => _subUserId = val;

  void incrementSubUserId(int amount) => subUserId = subUserId + amount;

  bool hasSubUserId() => _subUserId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  static LatestTaskStruct fromMap(Map<String, dynamic> data) =>
      LatestTaskStruct(
        id: castToType<int>(data['id']),
        clientId: castToType<int>(data['client_id']),
        userId: castToType<int>(data['userId']),
        subUserId: castToType<int>(data['subUserId']),
        createdAt: data['createdAt'] as DateTime?,
        clientName: data['clientName'] as String?,
      );

  static LatestTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? LatestTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'client_id': _clientId,
        'userId': _userId,
        'subUserId': _subUserId,
        'createdAt': _createdAt,
        'clientName': _clientName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'client_id': serializeParam(
          _clientId,
          ParamType.int,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'subUserId': serializeParam(
          _subUserId,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'clientName': serializeParam(
          _clientName,
          ParamType.String,
        ),
      }.withoutNulls;

  static LatestTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      LatestTaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        clientId: deserializeParam(
          data['client_id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        subUserId: deserializeParam(
          data['subUserId'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        clientName: deserializeParam(
          data['clientName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LatestTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LatestTaskStruct &&
        id == other.id &&
        clientId == other.clientId &&
        userId == other.userId &&
        subUserId == other.subUserId &&
        createdAt == other.createdAt &&
        clientName == other.clientName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, clientId, userId, subUserId, createdAt, clientName]);
}

LatestTaskStruct createLatestTaskStruct({
  int? id,
  int? clientId,
  int? userId,
  int? subUserId,
  DateTime? createdAt,
  String? clientName,
}) =>
    LatestTaskStruct(
      id: id,
      clientId: clientId,
      userId: userId,
      subUserId: subUserId,
      createdAt: createdAt,
      clientName: clientName,
    );
