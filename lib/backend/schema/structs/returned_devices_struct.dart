// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReturnedDevicesStruct extends BaseStruct {
  ReturnedDevicesStruct({
    int? id,
    int? catacheId,
    String? serialNumber,
    String? nameModele,
    String? nomComplet,
    String? endroits,
    String? dataReturned,
    String? matricule,
  })  : _id = id,
        _catacheId = catacheId,
        _serialNumber = serialNumber,
        _nameModele = nameModele,
        _nomComplet = nomComplet,
        _endroits = endroits,
        _dataReturned = dataReturned,
        _matricule = matricule;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "catache_id" field.
  int? _catacheId;
  int get catacheId => _catacheId ?? 0;
  set catacheId(int? val) => _catacheId = val;

  void incrementCatacheId(int amount) => catacheId = catacheId + amount;

  bool hasCatacheId() => _catacheId != null;

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

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  set nomComplet(String? val) => _nomComplet = val;

  bool hasNomComplet() => _nomComplet != null;

  // "endroits" field.
  String? _endroits;
  String get endroits => _endroits ?? '';
  set endroits(String? val) => _endroits = val;

  bool hasEndroits() => _endroits != null;

  // "dataReturned" field.
  String? _dataReturned;
  String get dataReturned => _dataReturned ?? '';
  set dataReturned(String? val) => _dataReturned = val;

  bool hasDataReturned() => _dataReturned != null;

  // "matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  static ReturnedDevicesStruct fromMap(Map<String, dynamic> data) =>
      ReturnedDevicesStruct(
        id: castToType<int>(data['id']),
        catacheId: castToType<int>(data['catache_id']),
        serialNumber: data['serial_number'] as String?,
        nameModele: data['nameModele'] as String?,
        nomComplet: data['nomComplet'] as String?,
        endroits: data['endroits'] as String?,
        dataReturned: data['dataReturned'] as String?,
        matricule: data['matricule'] as String?,
      );

  static ReturnedDevicesStruct? maybeFromMap(dynamic data) => data is Map
      ? ReturnedDevicesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'catache_id': _catacheId,
        'serial_number': _serialNumber,
        'nameModele': _nameModele,
        'nomComplet': _nomComplet,
        'endroits': _endroits,
        'dataReturned': _dataReturned,
        'matricule': _matricule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'catache_id': serializeParam(
          _catacheId,
          ParamType.int,
        ),
        'serial_number': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'nameModele': serializeParam(
          _nameModele,
          ParamType.String,
        ),
        'nomComplet': serializeParam(
          _nomComplet,
          ParamType.String,
        ),
        'endroits': serializeParam(
          _endroits,
          ParamType.String,
        ),
        'dataReturned': serializeParam(
          _dataReturned,
          ParamType.String,
        ),
        'matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReturnedDevicesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReturnedDevicesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        catacheId: deserializeParam(
          data['catache_id'],
          ParamType.int,
          false,
        ),
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
        nomComplet: deserializeParam(
          data['nomComplet'],
          ParamType.String,
          false,
        ),
        endroits: deserializeParam(
          data['endroits'],
          ParamType.String,
          false,
        ),
        dataReturned: deserializeParam(
          data['dataReturned'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['matricule'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReturnedDevicesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReturnedDevicesStruct &&
        id == other.id &&
        catacheId == other.catacheId &&
        serialNumber == other.serialNumber &&
        nameModele == other.nameModele &&
        nomComplet == other.nomComplet &&
        endroits == other.endroits &&
        dataReturned == other.dataReturned &&
        matricule == other.matricule;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        catacheId,
        serialNumber,
        nameModele,
        nomComplet,
        endroits,
        dataReturned,
        matricule
      ]);
}

ReturnedDevicesStruct createReturnedDevicesStruct({
  int? id,
  int? catacheId,
  String? serialNumber,
  String? nameModele,
  String? nomComplet,
  String? endroits,
  String? dataReturned,
  String? matricule,
}) =>
    ReturnedDevicesStruct(
      id: id,
      catacheId: catacheId,
      serialNumber: serialNumber,
      nameModele: nameModele,
      nomComplet: nomComplet,
      endroits: endroits,
      dataReturned: dataReturned,
      matricule: matricule,
    );
