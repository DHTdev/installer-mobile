// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// all tasks preClient who created by commercial
class TaskPreClientStruct extends BaseStruct {
  TaskPreClientStruct({
    int? id,
    int? deviceId,
    double? notification,
    DeviceStruct? device,
    double? billed,
    CategoryOfTaskStruct? categoryTask,
    CityStruct? city,
    CarStruct? car,
    int? stateTask,
    DateTime? startDate,
    bool? validation,

    /// user who assigned task to technical
    UserStruct? user,

    /// who realised task
    UserStruct? subUser,
  })  : _id = id,
        _deviceId = deviceId,
        _notification = notification,
        _device = device,
        _billed = billed,
        _categoryTask = categoryTask,
        _city = city,
        _car = car,
        _stateTask = stateTask,
        _startDate = startDate,
        _validation = validation,
        _user = user,
        _subUser = subUser;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "deviceId" field.
  int? _deviceId;
  int get deviceId => _deviceId ?? 0;
  set deviceId(int? val) => _deviceId = val;

  void incrementDeviceId(int amount) => deviceId = deviceId + amount;

  bool hasDeviceId() => _deviceId != null;

  // "notification" field.
  double? _notification;
  double get notification => _notification ?? 0.0;
  set notification(double? val) => _notification = val;

  void incrementNotification(double amount) =>
      notification = notification + amount;

  bool hasNotification() => _notification != null;

  // "device" field.
  DeviceStruct? _device;
  DeviceStruct get device => _device ?? DeviceStruct();
  set device(DeviceStruct? val) => _device = val;

  void updateDevice(Function(DeviceStruct) updateFn) {
    updateFn(_device ??= DeviceStruct());
  }

  bool hasDevice() => _device != null;

  // "billed" field.
  double? _billed;
  double get billed => _billed ?? 0.0;
  set billed(double? val) => _billed = val;

  void incrementBilled(double amount) => billed = billed + amount;

  bool hasBilled() => _billed != null;

  // "categoryTask" field.
  CategoryOfTaskStruct? _categoryTask;
  CategoryOfTaskStruct get categoryTask =>
      _categoryTask ?? CategoryOfTaskStruct();
  set categoryTask(CategoryOfTaskStruct? val) => _categoryTask = val;

  void updateCategoryTask(Function(CategoryOfTaskStruct) updateFn) {
    updateFn(_categoryTask ??= CategoryOfTaskStruct());
  }

  bool hasCategoryTask() => _categoryTask != null;

  // "city" field.
  CityStruct? _city;
  CityStruct get city => _city ?? CityStruct();
  set city(CityStruct? val) => _city = val;

  void updateCity(Function(CityStruct) updateFn) {
    updateFn(_city ??= CityStruct());
  }

  bool hasCity() => _city != null;

  // "car" field.
  CarStruct? _car;
  CarStruct get car => _car ?? CarStruct();
  set car(CarStruct? val) => _car = val;

  void updateCar(Function(CarStruct) updateFn) {
    updateFn(_car ??= CarStruct());
  }

  bool hasCar() => _car != null;

  // "stateTask" field.
  int? _stateTask;
  int get stateTask => _stateTask ?? 0;
  set stateTask(int? val) => _stateTask = val;

  void incrementStateTask(int amount) => stateTask = stateTask + amount;

  bool hasStateTask() => _stateTask != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "validation" field.
  bool? _validation;
  bool get validation => _validation ?? false;
  set validation(bool? val) => _validation = val;

  bool hasValidation() => _validation != null;

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  // "subUser" field.
  UserStruct? _subUser;
  UserStruct get subUser => _subUser ?? UserStruct();
  set subUser(UserStruct? val) => _subUser = val;

  void updateSubUser(Function(UserStruct) updateFn) {
    updateFn(_subUser ??= UserStruct());
  }

  bool hasSubUser() => _subUser != null;

  static TaskPreClientStruct fromMap(Map<String, dynamic> data) =>
      TaskPreClientStruct(
        id: castToType<int>(data['id']),
        deviceId: castToType<int>(data['deviceId']),
        notification: castToType<double>(data['notification']),
        device: data['device'] is DeviceStruct
            ? data['device']
            : DeviceStruct.maybeFromMap(data['device']),
        billed: castToType<double>(data['billed']),
        categoryTask: data['categoryTask'] is CategoryOfTaskStruct
            ? data['categoryTask']
            : CategoryOfTaskStruct.maybeFromMap(data['categoryTask']),
        city: data['city'] is CityStruct
            ? data['city']
            : CityStruct.maybeFromMap(data['city']),
        car: data['car'] is CarStruct
            ? data['car']
            : CarStruct.maybeFromMap(data['car']),
        stateTask: castToType<int>(data['stateTask']),
        startDate: data['startDate'] as DateTime?,
        validation: data['validation'] as bool?,
        user: data['user'] is UserStruct
            ? data['user']
            : UserStruct.maybeFromMap(data['user']),
        subUser: data['subUser'] is UserStruct
            ? data['subUser']
            : UserStruct.maybeFromMap(data['subUser']),
      );

  static TaskPreClientStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskPreClientStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'deviceId': _deviceId,
        'notification': _notification,
        'device': _device?.toMap(),
        'billed': _billed,
        'categoryTask': _categoryTask?.toMap(),
        'city': _city?.toMap(),
        'car': _car?.toMap(),
        'stateTask': _stateTask,
        'startDate': _startDate,
        'validation': _validation,
        'user': _user?.toMap(),
        'subUser': _subUser?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.int,
        ),
        'notification': serializeParam(
          _notification,
          ParamType.double,
        ),
        'device': serializeParam(
          _device,
          ParamType.DataStruct,
        ),
        'billed': serializeParam(
          _billed,
          ParamType.double,
        ),
        'categoryTask': serializeParam(
          _categoryTask,
          ParamType.DataStruct,
        ),
        'city': serializeParam(
          _city,
          ParamType.DataStruct,
        ),
        'car': serializeParam(
          _car,
          ParamType.DataStruct,
        ),
        'stateTask': serializeParam(
          _stateTask,
          ParamType.int,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'validation': serializeParam(
          _validation,
          ParamType.bool,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
        'subUser': serializeParam(
          _subUser,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TaskPreClientStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskPreClientStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.int,
          false,
        ),
        notification: deserializeParam(
          data['notification'],
          ParamType.double,
          false,
        ),
        device: deserializeStructParam(
          data['device'],
          ParamType.DataStruct,
          false,
          structBuilder: DeviceStruct.fromSerializableMap,
        ),
        billed: deserializeParam(
          data['billed'],
          ParamType.double,
          false,
        ),
        categoryTask: deserializeStructParam(
          data['categoryTask'],
          ParamType.DataStruct,
          false,
          structBuilder: CategoryOfTaskStruct.fromSerializableMap,
        ),
        city: deserializeStructParam(
          data['city'],
          ParamType.DataStruct,
          false,
          structBuilder: CityStruct.fromSerializableMap,
        ),
        car: deserializeStructParam(
          data['car'],
          ParamType.DataStruct,
          false,
          structBuilder: CarStruct.fromSerializableMap,
        ),
        stateTask: deserializeParam(
          data['stateTask'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        validation: deserializeParam(
          data['validation'],
          ParamType.bool,
          false,
        ),
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        subUser: deserializeStructParam(
          data['subUser'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskPreClientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskPreClientStruct &&
        id == other.id &&
        deviceId == other.deviceId &&
        notification == other.notification &&
        device == other.device &&
        billed == other.billed &&
        categoryTask == other.categoryTask &&
        city == other.city &&
        car == other.car &&
        stateTask == other.stateTask &&
        startDate == other.startDate &&
        validation == other.validation &&
        user == other.user &&
        subUser == other.subUser;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        deviceId,
        notification,
        device,
        billed,
        categoryTask,
        city,
        car,
        stateTask,
        startDate,
        validation,
        user,
        subUser
      ]);
}

TaskPreClientStruct createTaskPreClientStruct({
  int? id,
  int? deviceId,
  double? notification,
  DeviceStruct? device,
  double? billed,
  CategoryOfTaskStruct? categoryTask,
  CityStruct? city,
  CarStruct? car,
  int? stateTask,
  DateTime? startDate,
  bool? validation,
  UserStruct? user,
  UserStruct? subUser,
}) =>
    TaskPreClientStruct(
      id: id,
      deviceId: deviceId,
      notification: notification,
      device: device ?? DeviceStruct(),
      billed: billed,
      categoryTask: categoryTask ?? CategoryOfTaskStruct(),
      city: city ?? CityStruct(),
      car: car ?? CarStruct(),
      stateTask: stateTask,
      startDate: startDate,
      validation: validation,
      user: user ?? UserStruct(),
      subUser: subUser ?? UserStruct(),
    );
