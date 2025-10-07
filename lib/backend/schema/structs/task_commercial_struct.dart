// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// tasks who created by commercial
class TaskCommercialStruct extends BaseStruct {
  TaskCommercialStruct({
    int? id,
    int? cityId,
    String? clientName,
    int? phoneNumber,
    DateTime? createdAt,
    LatestTaskStruct? latestTask,
  })  : _id = id,
        _cityId = cityId,
        _clientName = clientName,
        _phoneNumber = phoneNumber,
        _createdAt = createdAt,
        _latestTask = latestTask;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "phoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  set phoneNumber(int? val) => _phoneNumber = val;

  void incrementPhoneNumber(int amount) => phoneNumber = phoneNumber + amount;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "latest_Task" field.
  LatestTaskStruct? _latestTask;
  LatestTaskStruct get latestTask => _latestTask ?? LatestTaskStruct();
  set latestTask(LatestTaskStruct? val) => _latestTask = val;

  void updateLatestTask(Function(LatestTaskStruct) updateFn) {
    updateFn(_latestTask ??= LatestTaskStruct());
  }

  bool hasLatestTask() => _latestTask != null;

  static TaskCommercialStruct fromMap(Map<String, dynamic> data) =>
      TaskCommercialStruct(
        id: castToType<int>(data['id']),
        cityId: castToType<int>(data['city_id']),
        clientName: data['clientName'] as String?,
        phoneNumber: castToType<int>(data['phoneNumber']),
        createdAt: data['created_at'] as DateTime?,
        latestTask: data['latest_Task'] is LatestTaskStruct
            ? data['latest_Task']
            : LatestTaskStruct.maybeFromMap(data['latest_Task']),
      );

  static TaskCommercialStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskCommercialStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'city_id': _cityId,
        'clientName': _clientName,
        'phoneNumber': _phoneNumber,
        'created_at': _createdAt,
        'latest_Task': _latestTask?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'clientName': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'latest_Task': serializeParam(
          _latestTask,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TaskCommercialStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskCommercialStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        clientName: deserializeParam(
          data['clientName'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        latestTask: deserializeStructParam(
          data['latest_Task'],
          ParamType.DataStruct,
          false,
          structBuilder: LatestTaskStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskCommercialStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskCommercialStruct &&
        id == other.id &&
        cityId == other.cityId &&
        clientName == other.clientName &&
        phoneNumber == other.phoneNumber &&
        createdAt == other.createdAt &&
        latestTask == other.latestTask;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, cityId, clientName, phoneNumber, createdAt, latestTask]);
}

TaskCommercialStruct createTaskCommercialStruct({
  int? id,
  int? cityId,
  String? clientName,
  int? phoneNumber,
  DateTime? createdAt,
  LatestTaskStruct? latestTask,
}) =>
    TaskCommercialStruct(
      id: id,
      cityId: cityId,
      clientName: clientName,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
      latestTask: latestTask ?? LatestTaskStruct(),
    );
