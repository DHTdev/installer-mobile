// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewTaskInfoStruct extends BaseStruct {
  NewTaskInfoStruct({
    List<ClientStruct>? clients,
    List<CategoryOfTaskStruct>? typeTask,
  })  : _clients = clients,
        _typeTask = typeTask;

  // "clients" field.
  List<ClientStruct>? _clients;
  List<ClientStruct> get clients => _clients ?? const [];
  set clients(List<ClientStruct>? val) => _clients = val;

  void updateClients(Function(List<ClientStruct>) updateFn) {
    updateFn(_clients ??= []);
  }

  bool hasClients() => _clients != null;

  // "typeTask" field.
  List<CategoryOfTaskStruct>? _typeTask;
  List<CategoryOfTaskStruct> get typeTask => _typeTask ?? const [];
  set typeTask(List<CategoryOfTaskStruct>? val) => _typeTask = val;

  void updateTypeTask(Function(List<CategoryOfTaskStruct>) updateFn) {
    updateFn(_typeTask ??= []);
  }

  bool hasTypeTask() => _typeTask != null;

  static NewTaskInfoStruct fromMap(Map<String, dynamic> data) =>
      NewTaskInfoStruct(
        clients: getStructList(
          data['clients'],
          ClientStruct.fromMap,
        ),
        typeTask: getStructList(
          data['typeTask'],
          CategoryOfTaskStruct.fromMap,
        ),
      );

  static NewTaskInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? NewTaskInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'clients': _clients?.map((e) => e.toMap()).toList(),
        'typeTask': _typeTask?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clients': serializeParam(
          _clients,
          ParamType.DataStruct,
          isList: true,
        ),
        'typeTask': serializeParam(
          _typeTask,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NewTaskInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewTaskInfoStruct(
        clients: deserializeStructParam<ClientStruct>(
          data['clients'],
          ParamType.DataStruct,
          true,
          structBuilder: ClientStruct.fromSerializableMap,
        ),
        typeTask: deserializeStructParam<CategoryOfTaskStruct>(
          data['typeTask'],
          ParamType.DataStruct,
          true,
          structBuilder: CategoryOfTaskStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NewTaskInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewTaskInfoStruct &&
        listEquality.equals(clients, other.clients) &&
        listEquality.equals(typeTask, other.typeTask);
  }

  @override
  int get hashCode => const ListEquality().hash([clients, typeTask]);
}

NewTaskInfoStruct createNewTaskInfoStruct() => NewTaskInfoStruct();
