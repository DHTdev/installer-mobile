// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UninstallTaskStruct extends BaseStruct {
  UninstallTaskStruct({
    List<String>? images,
    String? matricule,
    String? special,
    String? imei,
    String? observation,
    String? nsim,
  })  : _images = images,
        _matricule = matricule,
        _special = special,
        _imei = imei,
        _observation = observation,
        _nsim = nsim;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "special" field.
  String? _special;
  String get special => _special ?? '';
  set special(String? val) => _special = val;

  bool hasSpecial() => _special != null;

  // "IMEI" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "Observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "NSIM" field.
  String? _nsim;
  String get nsim => _nsim ?? '';
  set nsim(String? val) => _nsim = val;

  bool hasNsim() => _nsim != null;

  static UninstallTaskStruct fromMap(Map<String, dynamic> data) =>
      UninstallTaskStruct(
        images: getDataList(data['images']),
        matricule: data['Matricule'] as String?,
        special: data['special'] as String?,
        imei: data['IMEI'] as String?,
        observation: data['Observation'] as String?,
        nsim: data['NSIM'] as String?,
      );

  static UninstallTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? UninstallTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'images': _images,
        'Matricule': _matricule,
        'special': _special,
        'IMEI': _imei,
        'Observation': _observation,
        'NSIM': _nsim,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'special': serializeParam(
          _special,
          ParamType.String,
        ),
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'Observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'NSIM': serializeParam(
          _nsim,
          ParamType.String,
        ),
      }.withoutNulls;

  static UninstallTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      UninstallTaskStruct(
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        matricule: deserializeParam(
          data['Matricule'],
          ParamType.String,
          false,
        ),
        special: deserializeParam(
          data['special'],
          ParamType.String,
          false,
        ),
        imei: deserializeParam(
          data['IMEI'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['Observation'],
          ParamType.String,
          false,
        ),
        nsim: deserializeParam(
          data['NSIM'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UninstallTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UninstallTaskStruct &&
        listEquality.equals(images, other.images) &&
        matricule == other.matricule &&
        special == other.special &&
        imei == other.imei &&
        observation == other.observation &&
        nsim == other.nsim;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([images, matricule, special, imei, observation, nsim]);
}

UninstallTaskStruct createUninstallTaskStruct({
  String? matricule,
  String? special,
  String? imei,
  String? observation,
  String? nsim,
}) =>
    UninstallTaskStruct(
      matricule: matricule,
      special: special,
      imei: imei,
      observation: observation,
      nsim: nsim,
    );
