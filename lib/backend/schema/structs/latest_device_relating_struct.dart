// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LatestDeviceRelatingStruct extends BaseStruct {
  LatestDeviceRelatingStruct({
    int? id,
    int? modeleId,
    int? gpsPrincipale,
    int? proprietaire,
    int? etat,
    int? garantie,
    String? serialNumber,
    String? createdAt,
    String? updatedAt,
    String? numberBox,
    String? observation,
    PivotStruct? pivot,
  })  : _id = id,
        _modeleId = modeleId,
        _gpsPrincipale = gpsPrincipale,
        _proprietaire = proprietaire,
        _etat = etat,
        _garantie = garantie,
        _serialNumber = serialNumber,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _numberBox = numberBox,
        _observation = observation,
        _pivot = pivot;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "modele_id" field.
  int? _modeleId;
  int get modeleId => _modeleId ?? 0;
  set modeleId(int? val) => _modeleId = val;

  void incrementModeleId(int amount) => modeleId = modeleId + amount;

  bool hasModeleId() => _modeleId != null;

  // "gps_principale" field.
  int? _gpsPrincipale;
  int get gpsPrincipale => _gpsPrincipale ?? 0;
  set gpsPrincipale(int? val) => _gpsPrincipale = val;

  void incrementGpsPrincipale(int amount) =>
      gpsPrincipale = gpsPrincipale + amount;

  bool hasGpsPrincipale() => _gpsPrincipale != null;

  // "proprietaire" field.
  int? _proprietaire;
  int get proprietaire => _proprietaire ?? 0;
  set proprietaire(int? val) => _proprietaire = val;

  void incrementProprietaire(int amount) =>
      proprietaire = proprietaire + amount;

  bool hasProprietaire() => _proprietaire != null;

  // "etat" field.
  int? _etat;
  int get etat => _etat ?? 0;
  set etat(int? val) => _etat = val;

  void incrementEtat(int amount) => etat = etat + amount;

  bool hasEtat() => _etat != null;

  // "garantie" field.
  int? _garantie;
  int get garantie => _garantie ?? 0;
  set garantie(int? val) => _garantie = val;

  void incrementGarantie(int amount) => garantie = garantie + amount;

  bool hasGarantie() => _garantie != null;

  // "serial_number" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "numberBox" field.
  String? _numberBox;
  String get numberBox => _numberBox ?? '';
  set numberBox(String? val) => _numberBox = val;

  bool hasNumberBox() => _numberBox != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "pivot" field.
  PivotStruct? _pivot;
  PivotStruct get pivot => _pivot ?? PivotStruct();
  set pivot(PivotStruct? val) => _pivot = val;

  void updatePivot(Function(PivotStruct) updateFn) {
    updateFn(_pivot ??= PivotStruct());
  }

  bool hasPivot() => _pivot != null;

  static LatestDeviceRelatingStruct fromMap(Map<String, dynamic> data) =>
      LatestDeviceRelatingStruct(
        id: castToType<int>(data['id']),
        modeleId: castToType<int>(data['modele_id']),
        gpsPrincipale: castToType<int>(data['gps_principale']),
        proprietaire: castToType<int>(data['proprietaire']),
        etat: castToType<int>(data['etat']),
        garantie: castToType<int>(data['garantie']),
        serialNumber: data['serial_number'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        numberBox: data['numberBox'] as String?,
        observation: data['observation'] as String?,
        pivot: data['pivot'] is PivotStruct
            ? data['pivot']
            : PivotStruct.maybeFromMap(data['pivot']),
      );

  static LatestDeviceRelatingStruct? maybeFromMap(dynamic data) => data is Map
      ? LatestDeviceRelatingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'modele_id': _modeleId,
        'gps_principale': _gpsPrincipale,
        'proprietaire': _proprietaire,
        'etat': _etat,
        'garantie': _garantie,
        'serial_number': _serialNumber,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'numberBox': _numberBox,
        'observation': _observation,
        'pivot': _pivot?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'modele_id': serializeParam(
          _modeleId,
          ParamType.int,
        ),
        'gps_principale': serializeParam(
          _gpsPrincipale,
          ParamType.int,
        ),
        'proprietaire': serializeParam(
          _proprietaire,
          ParamType.int,
        ),
        'etat': serializeParam(
          _etat,
          ParamType.int,
        ),
        'garantie': serializeParam(
          _garantie,
          ParamType.int,
        ),
        'serial_number': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'numberBox': serializeParam(
          _numberBox,
          ParamType.String,
        ),
        'observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'pivot': serializeParam(
          _pivot,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LatestDeviceRelatingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LatestDeviceRelatingStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        modeleId: deserializeParam(
          data['modele_id'],
          ParamType.int,
          false,
        ),
        gpsPrincipale: deserializeParam(
          data['gps_principale'],
          ParamType.int,
          false,
        ),
        proprietaire: deserializeParam(
          data['proprietaire'],
          ParamType.int,
          false,
        ),
        etat: deserializeParam(
          data['etat'],
          ParamType.int,
          false,
        ),
        garantie: deserializeParam(
          data['garantie'],
          ParamType.int,
          false,
        ),
        serialNumber: deserializeParam(
          data['serial_number'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        numberBox: deserializeParam(
          data['numberBox'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['observation'],
          ParamType.String,
          false,
        ),
        pivot: deserializeStructParam(
          data['pivot'],
          ParamType.DataStruct,
          false,
          structBuilder: PivotStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LatestDeviceRelatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LatestDeviceRelatingStruct &&
        id == other.id &&
        modeleId == other.modeleId &&
        gpsPrincipale == other.gpsPrincipale &&
        proprietaire == other.proprietaire &&
        etat == other.etat &&
        garantie == other.garantie &&
        serialNumber == other.serialNumber &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        numberBox == other.numberBox &&
        observation == other.observation &&
        pivot == other.pivot;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        modeleId,
        gpsPrincipale,
        proprietaire,
        etat,
        garantie,
        serialNumber,
        createdAt,
        updatedAt,
        numberBox,
        observation,
        pivot
      ]);
}

LatestDeviceRelatingStruct createLatestDeviceRelatingStruct({
  int? id,
  int? modeleId,
  int? gpsPrincipale,
  int? proprietaire,
  int? etat,
  int? garantie,
  String? serialNumber,
  String? createdAt,
  String? updatedAt,
  String? numberBox,
  String? observation,
  PivotStruct? pivot,
}) =>
    LatestDeviceRelatingStruct(
      id: id,
      modeleId: modeleId,
      gpsPrincipale: gpsPrincipale,
      proprietaire: proprietaire,
      etat: etat,
      garantie: garantie,
      serialNumber: serialNumber,
      createdAt: createdAt,
      updatedAt: updatedAt,
      numberBox: numberBox,
      observation: observation,
      pivot: pivot ?? PivotStruct(),
    );
