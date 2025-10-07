// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryOfTaskStruct extends BaseStruct {
  CategoryOfTaskStruct({
    int? id,
    String? taskName,
  })  : _id = id,
        _taskName = taskName;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;

  bool hasTaskName() => _taskName != null;

  static CategoryOfTaskStruct fromMap(Map<String, dynamic> data) =>
      CategoryOfTaskStruct(
        id: castToType<int>(data['id']),
        taskName: data['taskName'] as String?,
      );

  static CategoryOfTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoryOfTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'taskName': _taskName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'taskName': serializeParam(
          _taskName,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoryOfTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryOfTaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        taskName: deserializeParam(
          data['taskName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoryOfTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryOfTaskStruct &&
        id == other.id &&
        taskName == other.taskName;
  }

  @override
  int get hashCode => const ListEquality().hash([id, taskName]);
}

CategoryOfTaskStruct createCategoryOfTaskStruct({
  int? id,
  String? taskName,
}) =>
    CategoryOfTaskStruct(
      id: id,
      taskName: taskName,
    );
