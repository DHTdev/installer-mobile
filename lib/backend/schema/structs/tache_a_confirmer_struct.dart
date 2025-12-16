// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TacheAConfirmerStruct extends BaseStruct {
  TacheAConfirmerStruct({
    String? clientName,
    String? etatTache,
    int? tacheID,
    int? createdByID,
    String? date,
    String? telephoneClient,
    String? userName,
    String? catache,
    String? validation,
  })  : _clientName = clientName,
        _etatTache = etatTache,
        _tacheID = tacheID,
        _createdByID = createdByID,
        _date = date,
        _telephoneClient = telephoneClient,
        _userName = userName,
        _catache = catache,
        _validation = validation;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "etatTache" field.
  String? _etatTache;
  String get etatTache => _etatTache ?? '';
  set etatTache(String? val) => _etatTache = val;

  bool hasEtatTache() => _etatTache != null;

  // "tacheID" field.
  int? _tacheID;
  int get tacheID => _tacheID ?? 0;
  set tacheID(int? val) => _tacheID = val;

  void incrementTacheID(int amount) => tacheID = tacheID + amount;

  bool hasTacheID() => _tacheID != null;

  // "createdByID" field.
  int? _createdByID;
  int get createdByID => _createdByID ?? 0;
  set createdByID(int? val) => _createdByID = val;

  void incrementCreatedByID(int amount) => createdByID = createdByID + amount;

  bool hasCreatedByID() => _createdByID != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "telephoneClient" field.
  String? _telephoneClient;
  String get telephoneClient => _telephoneClient ?? '';
  set telephoneClient(String? val) => _telephoneClient = val;

  bool hasTelephoneClient() => _telephoneClient != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "catache" field.
  String? _catache;
  String get catache => _catache ?? '';
  set catache(String? val) => _catache = val;

  bool hasCatache() => _catache != null;

  // "validation" field.
  String? _validation;
  String get validation => _validation ?? '';
  set validation(String? val) => _validation = val;

  bool hasValidation() => _validation != null;

  static TacheAConfirmerStruct fromMap(Map<String, dynamic> data) =>
      TacheAConfirmerStruct(
        clientName: data['clientName'] as String?,
        etatTache: data['etatTache'] as String?,
        tacheID: castToType<int>(data['tacheID']),
        createdByID: castToType<int>(data['createdByID']),
        date: data['date'] as String?,
        telephoneClient: data['telephoneClient'] as String?,
        userName: data['userName'] as String?,
        catache: data['catache'] as String?,
        validation: data['validation'] as String?,
      );

  static TacheAConfirmerStruct? maybeFromMap(dynamic data) => data is Map
      ? TacheAConfirmerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'clientName': _clientName,
        'etatTache': _etatTache,
        'tacheID': _tacheID,
        'createdByID': _createdByID,
        'date': _date,
        'telephoneClient': _telephoneClient,
        'userName': _userName,
        'catache': _catache,
        'validation': _validation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clientName': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'etatTache': serializeParam(
          _etatTache,
          ParamType.String,
        ),
        'tacheID': serializeParam(
          _tacheID,
          ParamType.int,
        ),
        'createdByID': serializeParam(
          _createdByID,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'telephoneClient': serializeParam(
          _telephoneClient,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'catache': serializeParam(
          _catache,
          ParamType.String,
        ),
        'validation': serializeParam(
          _validation,
          ParamType.String,
        ),
      }.withoutNulls;

  static TacheAConfirmerStruct fromSerializableMap(Map<String, dynamic> data) =>
      TacheAConfirmerStruct(
        clientName: deserializeParam(
          data['clientName'],
          ParamType.String,
          false,
        ),
        etatTache: deserializeParam(
          data['etatTache'],
          ParamType.String,
          false,
        ),
        tacheID: deserializeParam(
          data['tacheID'],
          ParamType.int,
          false,
        ),
        createdByID: deserializeParam(
          data['createdByID'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        telephoneClient: deserializeParam(
          data['telephoneClient'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        catache: deserializeParam(
          data['catache'],
          ParamType.String,
          false,
        ),
        validation: deserializeParam(
          data['validation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TacheAConfirmerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TacheAConfirmerStruct &&
        clientName == other.clientName &&
        etatTache == other.etatTache &&
        tacheID == other.tacheID &&
        createdByID == other.createdByID &&
        date == other.date &&
        telephoneClient == other.telephoneClient &&
        userName == other.userName &&
        catache == other.catache &&
        validation == other.validation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        clientName,
        etatTache,
        tacheID,
        createdByID,
        date,
        telephoneClient,
        userName,
        catache,
        validation
      ]);
}

TacheAConfirmerStruct createTacheAConfirmerStruct({
  String? clientName,
  String? etatTache,
  int? tacheID,
  int? createdByID,
  String? date,
  String? telephoneClient,
  String? userName,
  String? catache,
  String? validation,
}) =>
    TacheAConfirmerStruct(
      clientName: clientName,
      etatTache: etatTache,
      tacheID: tacheID,
      createdByID: createdByID,
      date: date,
      telephoneClient: telephoneClient,
      userName: userName,
      catache: catache,
      validation: validation,
    );
