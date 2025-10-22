// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExceptionTaskFormStruct extends BaseStruct {
  ExceptionTaskFormStruct({
    String? nomComplet,
    String? typeTache,
    String? typeAppareil,
    String? imei,
    String? siM,
    DateTime? date,
    String? accessoire,
    String? affect,
    String? typeSIM,
    String? description,
    List<String>? images,
    String? observation,
    String? telephone,
    String? email,
    String? typeTask,
    String? quantite,
  })  : _nomComplet = nomComplet,
        _typeTache = typeTache,
        _typeAppareil = typeAppareil,
        _imei = imei,
        _siM = siM,
        _date = date,
        _accessoire = accessoire,
        _affect = affect,
        _typeSIM = typeSIM,
        _description = description,
        _images = images,
        _observation = observation,
        _telephone = telephone,
        _email = email,
        _typeTask = typeTask,
        _quantite = quantite;

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  set nomComplet(String? val) => _nomComplet = val;

  bool hasNomComplet() => _nomComplet != null;

  // "typeTache" field.
  String? _typeTache;
  String get typeTache => _typeTache ?? '';
  set typeTache(String? val) => _typeTache = val;

  bool hasTypeTache() => _typeTache != null;

  // "TypeAppareil" field.
  String? _typeAppareil;
  String get typeAppareil => _typeAppareil ?? '';
  set typeAppareil(String? val) => _typeAppareil = val;

  bool hasTypeAppareil() => _typeAppareil != null;

  // "IMEI" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "SiM" field.
  String? _siM;
  String get siM => _siM ?? '';
  set siM(String? val) => _siM = val;

  bool hasSiM() => _siM != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "Accessoire" field.
  String? _accessoire;
  String get accessoire => _accessoire ?? '';
  set accessoire(String? val) => _accessoire = val;

  bool hasAccessoire() => _accessoire != null;

  // "affect" field.
  String? _affect;
  String get affect => _affect ?? '';
  set affect(String? val) => _affect = val;

  bool hasAffect() => _affect != null;

  // "TypeSIM" field.
  String? _typeSIM;
  String get typeSIM => _typeSIM ?? '';
  set typeSIM(String? val) => _typeSIM = val;

  bool hasTypeSIM() => _typeSIM != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "telephone" field.
  String? _telephone;
  String get telephone => _telephone ?? '';
  set telephone(String? val) => _telephone = val;

  bool hasTelephone() => _telephone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "typeTask" field.
  String? _typeTask;
  String get typeTask => _typeTask ?? '';
  set typeTask(String? val) => _typeTask = val;

  bool hasTypeTask() => _typeTask != null;

  // "Quantite" field.
  String? _quantite;
  String get quantite => _quantite ?? '1';
  set quantite(String? val) => _quantite = val;

  bool hasQuantite() => _quantite != null;

  static ExceptionTaskFormStruct fromMap(Map<String, dynamic> data) =>
      ExceptionTaskFormStruct(
        nomComplet: data['nomComplet'] as String?,
        typeTache: data['typeTache'] as String?,
        typeAppareil: data['TypeAppareil'] as String?,
        imei: data['IMEI'] as String?,
        siM: data['SiM'] as String?,
        date: data['Date'] as DateTime?,
        accessoire: data['Accessoire'] as String?,
        affect: data['affect'] as String?,
        typeSIM: data['TypeSIM'] as String?,
        description: data['Description'] as String?,
        images: getDataList(data['images']),
        observation: data['observation'] as String?,
        telephone: data['telephone'] as String?,
        email: data['email'] as String?,
        typeTask: data['typeTask'] as String?,
        quantite: data['Quantite'] as String?,
      );

  static ExceptionTaskFormStruct? maybeFromMap(dynamic data) => data is Map
      ? ExceptionTaskFormStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomComplet': _nomComplet,
        'typeTache': _typeTache,
        'TypeAppareil': _typeAppareil,
        'IMEI': _imei,
        'SiM': _siM,
        'Date': _date,
        'Accessoire': _accessoire,
        'affect': _affect,
        'TypeSIM': _typeSIM,
        'Description': _description,
        'images': _images,
        'observation': _observation,
        'telephone': _telephone,
        'email': _email,
        'typeTask': _typeTask,
        'Quantite': _quantite,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomComplet': serializeParam(
          _nomComplet,
          ParamType.String,
        ),
        'typeTache': serializeParam(
          _typeTache,
          ParamType.String,
        ),
        'TypeAppareil': serializeParam(
          _typeAppareil,
          ParamType.String,
        ),
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'SiM': serializeParam(
          _siM,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'Accessoire': serializeParam(
          _accessoire,
          ParamType.String,
        ),
        'affect': serializeParam(
          _affect,
          ParamType.String,
        ),
        'TypeSIM': serializeParam(
          _typeSIM,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'telephone': serializeParam(
          _telephone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'typeTask': serializeParam(
          _typeTask,
          ParamType.String,
        ),
        'Quantite': serializeParam(
          _quantite,
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
        typeTache: deserializeParam(
          data['typeTache'],
          ParamType.String,
          false,
        ),
        typeAppareil: deserializeParam(
          data['TypeAppareil'],
          ParamType.String,
          false,
        ),
        imei: deserializeParam(
          data['IMEI'],
          ParamType.String,
          false,
        ),
        siM: deserializeParam(
          data['SiM'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        accessoire: deserializeParam(
          data['Accessoire'],
          ParamType.String,
          false,
        ),
        affect: deserializeParam(
          data['affect'],
          ParamType.String,
          false,
        ),
        typeSIM: deserializeParam(
          data['TypeSIM'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        observation: deserializeParam(
          data['observation'],
          ParamType.String,
          false,
        ),
        telephone: deserializeParam(
          data['telephone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        typeTask: deserializeParam(
          data['typeTask'],
          ParamType.String,
          false,
        ),
        quantite: deserializeParam(
          data['Quantite'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExceptionTaskFormStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExceptionTaskFormStruct &&
        nomComplet == other.nomComplet &&
        typeTache == other.typeTache &&
        typeAppareil == other.typeAppareil &&
        imei == other.imei &&
        siM == other.siM &&
        date == other.date &&
        accessoire == other.accessoire &&
        affect == other.affect &&
        typeSIM == other.typeSIM &&
        description == other.description &&
        listEquality.equals(images, other.images) &&
        observation == other.observation &&
        telephone == other.telephone &&
        email == other.email &&
        typeTask == other.typeTask &&
        quantite == other.quantite;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nomComplet,
        typeTache,
        typeAppareil,
        imei,
        siM,
        date,
        accessoire,
        affect,
        typeSIM,
        description,
        images,
        observation,
        telephone,
        email,
        typeTask,
        quantite
      ]);
}

ExceptionTaskFormStruct createExceptionTaskFormStruct({
  String? nomComplet,
  String? typeTache,
  String? typeAppareil,
  String? imei,
  String? siM,
  DateTime? date,
  String? accessoire,
  String? affect,
  String? typeSIM,
  String? description,
  String? observation,
  String? telephone,
  String? email,
  String? typeTask,
  String? quantite,
}) =>
    ExceptionTaskFormStruct(
      nomComplet: nomComplet,
      typeTache: typeTache,
      typeAppareil: typeAppareil,
      imei: imei,
      siM: siM,
      date: date,
      accessoire: accessoire,
      affect: affect,
      typeSIM: typeSIM,
      description: description,
      observation: observation,
      telephone: telephone,
      email: email,
      typeTask: typeTask,
      quantite: quantite,
    );
