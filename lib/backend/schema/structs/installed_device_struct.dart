// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// struct of installed device for raparation task
class InstalledDeviceStruct extends BaseStruct {
  InstalledDeviceStruct({
    int? id,
    String? serialNumber,
    int? gpsPrincipale,
    int? tacheId,
    int? vehiculeId,
    DateTime? updatedAt,
    List<LatestDeviceRelatingStruct>? latestSimRelating,
  })  : _id = id,
        _serialNumber = serialNumber,
        _gpsPrincipale = gpsPrincipale,
        _tacheId = tacheId,
        _vehiculeId = vehiculeId,
        _updatedAt = updatedAt,
        _latestSimRelating = latestSimRelating;

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

  // "gps_principale" field.
  int? _gpsPrincipale;
  int get gpsPrincipale => _gpsPrincipale ?? 0;
  set gpsPrincipale(int? val) => _gpsPrincipale = val;

  void incrementGpsPrincipale(int amount) =>
      gpsPrincipale = gpsPrincipale + amount;

  bool hasGpsPrincipale() => _gpsPrincipale != null;

  // "tache_id" field.
  int? _tacheId;
  int get tacheId => _tacheId ?? 0;
  set tacheId(int? val) => _tacheId = val;

  void incrementTacheId(int amount) => tacheId = tacheId + amount;

  bool hasTacheId() => _tacheId != null;

  // "vehicule_id" field.
  int? _vehiculeId;
  int get vehiculeId => _vehiculeId ?? 0;
  set vehiculeId(int? val) => _vehiculeId = val;

  void incrementVehiculeId(int amount) => vehiculeId = vehiculeId + amount;

  bool hasVehiculeId() => _vehiculeId != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "latest_sim_relating" field.
  List<LatestDeviceRelatingStruct>? _latestSimRelating;
  List<LatestDeviceRelatingStruct> get latestSimRelating =>
      _latestSimRelating ?? const [];
  set latestSimRelating(List<LatestDeviceRelatingStruct>? val) =>
      _latestSimRelating = val;

  // void updateLatestSimRelating(Function(List<LatestDeviceRelatingStruct>) updateFn) {
  //   updateFn(_latestSimRelating ??= List<LatestDeviceRelatingStruct>());
  // }

  bool hasLatestSimRelating() => _latestSimRelating != null;

  static InstalledDeviceStruct fromMap(Map<String, dynamic> data) =>
      InstalledDeviceStruct(
        id: castToType<int>(data['id']),
        serialNumber: data['serial_number'] as String?,
        gpsPrincipale: castToType<int>(data['gps_principale']),
        tacheId: castToType<int>(data['tache_id']),
        vehiculeId: castToType<int>(data['vehicule_id']),
        updatedAt: new DateFormat('yyyy-MM-ddTHH:mm:ss').parse(data['updated_at']),
        latestSimRelating: getStructList(data["latest_sim_relating"], (m) => LatestDeviceRelatingStruct.fromMap({...m})
),
      );

  static InstalledDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? InstalledDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'serial_number': _serialNumber,
        'gps_principale': _gpsPrincipale,
        'tache_id': _tacheId,
        'vehicule_id': _vehiculeId,
        'updated_at': _updatedAt,
        'latest_sim_relating': _latestSimRelating?.map((e) => e.toMap()).toList(),
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
        'gps_principale': serializeParam(
          _gpsPrincipale,
          ParamType.int,
        ),
        'tache_id': serializeParam(
          _tacheId,
          ParamType.int,
        ),
        'vehicule_id': serializeParam(
          _vehiculeId,
          ParamType.int,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'latest_sim_relating': serializeParam(
          _latestSimRelating,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static InstalledDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstalledDeviceStruct(
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
        gpsPrincipale: deserializeParam(
          data['gps_principale'],
          ParamType.int,
          false,
        ),
        tacheId: deserializeParam(
          data['tache_id'],
          ParamType.int,
          false,
        ),
        vehiculeId: deserializeParam(
          data['vehicule_id'],
          ParamType.int,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        latestSimRelating: deserializeStructParam(
          data['latest_sim_relating'],
          ParamType.DataStruct,
          false,
          structBuilder: LatestDeviceRelatingStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InstalledDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstalledDeviceStruct &&
        id == other.id &&
        serialNumber == other.serialNumber &&
        gpsPrincipale == other.gpsPrincipale &&
        tacheId == other.tacheId &&
        vehiculeId == other.vehiculeId &&
        updatedAt == other.updatedAt &&
        latestSimRelating == other.latestSimRelating;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        serialNumber,
        gpsPrincipale,
        tacheId,
        vehiculeId,
        updatedAt,
        latestSimRelating
      ]);
}

// InstalledDeviceStruct createInstalledDeviceStruct({
//   int? id,
//   String? serialNumber,
//   int? gpsPrincipale,
//   int? tacheId,
//   int? vehiculeId,
//   DateTime? updatedAt,
//   LatestDeviceRelatingStruct? latestSimRelating,
// }) =>
//     InstalledDeviceStruct(
//       id: id,
//       serialNumber: serialNumber,
//       gpsPrincipale: gpsPrincipale,
//       tacheId: tacheId,
//       vehiculeId: vehiculeId,
//       updatedAt: updatedAt,
//       latestSimRelating: latestSimRelating ?? LatestDeviceRelatingStruct(),
    // );