// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExceptionTaskFormStruct extends BaseStruct {
  ExceptionTaskFormStruct({
    String? nomComplet,
    String? telephone,
    String? typeTache,
    String? typeTask,
    String? date,
    String? quantite,
    String? clientCity,
    String? affect,
    String? description,
  })  : _nomComplet = nomComplet,
        _telephone = telephone,
        _typeTache = typeTache,
        _typeTask = typeTask,
        _date = date,
        _quantite = quantite,
        _clientCity = clientCity,
        _affect = affect,
        _description = description;

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  set nomComplet(String? val) => _nomComplet = val;

  bool hasNomComplet() => _nomComplet != null;

  // "telephone" field.
  String? _telephone;
  String get telephone => _telephone ?? '';
  set telephone(String? val) => _telephone = val;

  bool hasTelephone() => _telephone != null;

  // "typeTache" field.
  String? _typeTache;
  String get typeTache => _typeTache ?? '';
  set typeTache(String? val) => _typeTache = val;

  bool hasTypeTache() => _typeTache != null;

  // "typeTache" field.
  String? _typeTask;
  String get typeTask => _typeTask ?? '';
  set typeTask(String? val) => _typeTask = val;

  bool hasTypeTask() => _typeTask != null;

  // "Date" field.
  String? _date;
  String? get date => _date;
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "Quantite" field.
  String? _quantite;
  String get quantite => _quantite ?? '1';
  set quantite(String? val) => _quantite = val;

  bool hasQuantite() => _quantite != null;

  // "clientCity" field.
  String? _clientCity;
  String get clientCity => _clientCity ?? '';
  set clientCity(String? val) => _clientCity = val;

  bool hasClientCity() => _clientCity != null;

  // "affect" field.
  String? _affect;
  String get affect => _affect ?? '';
  set affect(String? val) => _affect = val;

  bool hasAffect() => _affect != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static ExceptionTaskFormStruct fromMap(Map<String, dynamic> data) =>
      ExceptionTaskFormStruct(
        nomComplet: data['nomComplet'] as String?,
        telephone: data['telephone'] as String?,
        typeTache: data['typeTache'] as String?,
        date: data['Date'] as String?,
        quantite: data['Quantite'] as String?,
        clientCity: data['clientCity'] as String?,
        affect: data['affect'] as String?,
        description: data['Description'] as String?,
      );

  static ExceptionTaskFormStruct? maybeFromMap(dynamic data) => data is Map
      ? ExceptionTaskFormStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomComplet': _nomComplet,
        'telephone': _telephone,
        'typeTache': _typeTache,
        'TypeTask': _typeTask,
        'Date': _date,
        'Quantite': _quantite,
        'clientCity': _clientCity,
        'affect': _affect,
        'Description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomComplet': serializeParam(
          _nomComplet,
          ParamType.String,
        ),
        'telephone': serializeParam(
          _telephone,
          ParamType.String,
        ),
        'typeTache': serializeParam(
          _typeTache,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.String,
        ),
        'Quantite': serializeParam(
          _quantite,
          ParamType.String,
        ),
        'clientCity': serializeParam(
          _clientCity,
          ParamType.String,
        ),
        'affect': serializeParam(
          _affect,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExceptionTaskFormStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExceptionTaskFormStruct(
        nomComplet: deserializeParam(
          data['nomComplet'],
          ParamType.String,
          false,
        ),
        telephone: deserializeParam(
          data['telephone'],
          ParamType.String,
          false,
        ),
        typeTache: deserializeParam(
          data['typeTache'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.String,
          false,
        ),
        quantite: deserializeParam(
          data['Quantite'],
          ParamType.String,
          false,
        ),
        clientCity: deserializeParam(
          data['clientCity'],
          ParamType.String,
          false,
        ),
        affect: deserializeParam(
          data['affect'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExceptionTaskFormStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExceptionTaskFormStruct &&
        nomComplet == other.nomComplet &&
        telephone == other.telephone &&
        typeTache == other.typeTache &&
        date == other.date &&
        quantite == other.quantite &&
        clientCity == other.clientCity &&
        affect == other.affect &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nomComplet,
        telephone,
        typeTache,
        date,
        quantite,
        clientCity,
        affect,
        description
      ]);
}

ExceptionTaskFormStruct createExceptionTaskFormStruct({
  String? nomComplet,
  String? telephone,
  String? typeTache,
  String? typeTask,
  String? date,
  String? quantite,
  String? clientCity,
  String? affect,
  String? description,
}) =>
    ExceptionTaskFormStruct(
      nomComplet: nomComplet,
      telephone: telephone,
      typeTache: typeTache,
      typeTask: typeTask,
      date: date,
      quantite: quantite,
      clientCity: clientCity,
      affect: affect,
      description: description,
    );
