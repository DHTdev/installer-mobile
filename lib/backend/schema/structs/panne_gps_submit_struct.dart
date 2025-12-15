// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanneGpsSubmitStruct extends BaseStruct {
  PanneGpsSubmitStruct({
    String? imei,
    String? matricule,
    String? ancienneIMEI,
    String? nsim,
    String? observation,
    String? special,  
    bool? statut,
    String? typeRelay,
    List<Map<String, dynamic>>? images,
  })  : _imei = imei,
        _matricule = matricule,
        _ancienneIMEI = ancienneIMEI,
        _nsim = nsim,
        _observation = observation,
        _special = special,
        _statut = statut,
        _typeRelais = typeRelay,
        _images = images;

  // "imei" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "AncienneIMEI" field.
  String? _ancienneIMEI;
  String get ancienneIMEI => _ancienneIMEI ?? '';
  set ancienneIMEI(String? val) => _ancienneIMEI = val;

  bool hasAncienneIMEI() => _ancienneIMEI != null;

  // "NSIM" field.
  String? _nsim;
  String get nsim => _nsim ?? '';
  set nsim(String? val) => _nsim = val;

  bool hasNsim() => _nsim != null;

  // "Observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "special" field.
  String? _special;
  String get special => _special ?? '';
  set special(String? val) => _special = val;

  bool hasSpecial() => _special != null;

  // "statut" field.
  bool? _statut;
  bool get statut => _statut ?? false;
  set statut(bool? val) => _statut = val;

  bool hasStatut() => _statut != "";

  // "images" field.
  List<Map<String, dynamic>>? _images;
  List<Map<String, dynamic>>? get images => _images;
  set images(List<Map<String, dynamic>>? val) => _images = [
        {"data": val, "extension": "jpg"}
      ];

  // void updateImages(Function(List<String>) updateFn) {
  //   updateFn(_images ??= []);
  // }

  bool hasImages() => _images != null;

  // "typeRelay" field.
  String? _typeRelais;
  String get typeRelay => _typeRelais ?? '';
  set typeRelay(String? val) => _typeRelais = val;

  bool hasTypeRelais() => _typeRelais != null;
  static PanneGpsSubmitStruct fromMap(Map<String, dynamic> data) => PanneGpsSubmitStruct(
        imei: data['imei'] as String?,
        matricule: data['Matricule'] as String?,
        ancienneIMEI: data['AncienneIMEI'] as String?,
        nsim: data['NSIM'] as String?,
        observation: data['Observation'] as String?,
        special: data['special'] as String?,
        statut: data['statut'] as bool?,
        typeRelay: data['typeRelay'] as String?,
        images: getDataList(data['images']),
      );

  static PanneGpsSubmitStruct? maybeFromMap(dynamic data) => data is Map ? PanneGpsSubmitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imei': _imei,
        'Matricule': _matricule,
        'AncienneIMEI': _ancienneIMEI,
        'NSIM': _nsim,
        'Observation': _observation,
        'special': _special,
        'statut': _statut,
        'typeRelay': _typeRelais,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imei': serializeParam(
          _imei,
          ParamType.String,
        ),
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'AncienneIMEI': serializeParam(
          _ancienneIMEI,
          ParamType.String,
        ),
        'NSIM': serializeParam(
          _nsim,
          ParamType.String,
        ),
        'Observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'special': serializeParam(
          _special,
          ParamType.String,
        ),
        'statut': serializeParam(
          _statut,
          ParamType.bool,
        ),
        'typeRelay': serializeParam(
          _typeRelais,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PanneGpsSubmitStruct fromSerializableMap(Map<String, dynamic> data) => PanneGpsSubmitStruct(
        imei: deserializeParam(
          data['imei'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['Matricule'],
          ParamType.String,
          false,
        ),
        ancienneIMEI: deserializeParam(
          data['AncienneIMEI'],
          ParamType.String,
          false,
        ),
        nsim: deserializeParam(
          data['NSIM'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['Observation'],
          ParamType.String,
          false,
        ),
        special: deserializeParam(
          data['special'],
          ParamType.String,
          false,
        ),
        statut: deserializeParam(
          data['statut'],
          ParamType.bool,
          false,
        ),
        typeRelay: deserializeParam(
          data['typeRelay'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PanneGpsSubmitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PanneGpsSubmitStruct &&
        imei == other.imei &&
        matricule == other.matricule &&
        ancienneIMEI == other.ancienneIMEI &&
        nsim == other.nsim &&
        observation == other.observation &&
        special == other.special &&
        statut == other.statut &&
        typeRelay == other.typeRelay &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([imei, matricule, ancienneIMEI, nsim, observation, special, statut, images, typeRelay]);
}

PanneGpsSubmitStruct createPanneGpsSubmitStruct({
  String? imei,
  String? matricule,
  String? ancienneIMEI,
  String? nsim,
  String? observation,
  String? special,
  bool? statut,
  String? typeRelay,
  List<Map<String, dynamic>>? images,
}) =>
    PanneGpsSubmitStruct(
      imei: imei,
      matricule: matricule,
      ancienneIMEI: ancienneIMEI,
      nsim: nsim,
      observation: observation,
      special: special,
      statut: statut,
      typeRelay: typeRelay,
      images: images,
    );
