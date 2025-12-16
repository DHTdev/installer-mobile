// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstallationSubmitStruct extends BaseStruct {
  InstallationSubmitStruct({
    String? nomComplet,
    String? matricule,
    String? imei,
    String? nsim,
    String? gPSstatut,
    String? observation,
    List<String>? imagesTask,
    String? etatTache,
    List<String>? accessory,
    String? typeRelais,
  })  : _nomComplet = nomComplet,
        _matricule = matricule,
        _imei = imei,
        _nsim = nsim,
        _gPSstatut = gPSstatut,
        _observation = observation,
        _imagesTask = imagesTask,
        _etatTache = etatTache,
        _accessory = accessory,
        _typeRelais = typeRelais;

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  set nomComplet(String? val) => _nomComplet = val;

  bool hasNomComplet() => _nomComplet != null;

  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "IMEI" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "NSIM" field.
  String? _nsim;
  String get nsim => _nsim ?? '';
  set nsim(String? val) => _nsim = val;

  bool hasNsim() => _nsim != null;

  // "GPSstatut" field.
  String? _gPSstatut;
  String get gPSstatut => _gPSstatut ?? '';
  set gPSstatut(String? val) => _gPSstatut = val;

  bool hasGPSstatut() => _gPSstatut != null;

  // "Observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "imagesTask" field.
  List<String>? _imagesTask;
  List<String> get imagesTask => _imagesTask ?? const [];
  set imagesTask(List<String>? val) => _imagesTask = val;

  void updateImagesTask(Function(List<String>) updateFn) {
    updateFn(_imagesTask ??= []);
  }

  bool hasImagesTask() => _imagesTask != null;

  // "etatTache" field.
  String? _etatTache;
  String get etatTache => _etatTache ?? '';
  set etatTache(String? val) => _etatTache = val;

  bool hasEtatTache() => _etatTache != null;

  // "accessory" field.
  List<String>? _accessory;
  List<String> get accessory => _accessory ?? const [];
  set accessory(List<String>? val) => _accessory = val;

  void updateAccessory(Function(List<String>) updateFn) {
    updateFn(_accessory ??= []);
  }

  bool hasAccessory() => _accessory != null;

  // "typeRelais" field.
  String? _typeRelais;
  String get typeRelais => _typeRelais ?? '';
  set typeRelais(String? val) => _typeRelais = val;

  bool hasTypeRelais() => _typeRelais != null;

  static InstallationSubmitStruct fromMap(Map<String, dynamic> data) =>
      InstallationSubmitStruct(
        nomComplet: data['nomComplet'] as String?,
        matricule: data['Matricule'] as String?,
        imei: data['IMEI'] as String?,
        nsim: data['NSIM'] as String?,
        gPSstatut: data['GPSstatut'] as String?,
        observation: data['Observation'] as String?,
        imagesTask: getDataList(data['imagesTask']),
        etatTache: data['etatTache'] as String?,
        accessory: getDataList(data['accessory']),
        typeRelais: data['typeRelais'] as String?,
      );

  static InstallationSubmitStruct? maybeFromMap(dynamic data) => data is Map
      ? InstallationSubmitStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomComplet': _nomComplet,
        'Matricule': _matricule,
        'IMEI': _imei,
        'NSIM': _nsim,
        'GPSstatut': _gPSstatut,
        'Observation': _observation,
        'imagesTask': _imagesTask,
        'etatTache': _etatTache,
        'accessory': _accessory,
        'typeRelais': _typeRelais,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomComplet': serializeParam(
          _nomComplet,
          ParamType.String,
        ),
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'NSIM': serializeParam(
          _nsim,
          ParamType.String,
        ),
        'GPSstatut': serializeParam(
          _gPSstatut,
          ParamType.String,
        ),
        'Observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'imagesTask': serializeParam(
          _imagesTask,
          ParamType.String,
          isList: true,
        ),
        'etatTache': serializeParam(
          _etatTache,
          ParamType.String,
        ),
        'accessory': serializeParam(
          _accessory,
          ParamType.String,
          isList: true,
        ),
        'typeRelais': serializeParam(
          _typeRelais,
          ParamType.String,
        ),
      }.withoutNulls;

  static InstallationSubmitStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstallationSubmitStruct(
        nomComplet: deserializeParam(
          data['nomComplet'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['Matricule'],
          ParamType.String,
          false,
        ),
        imei: deserializeParam(
          data['IMEI'],
          ParamType.String,
          false,
        ),
        nsim: deserializeParam(
          data['NSIM'],
          ParamType.String,
          false,
        ),
        gPSstatut: deserializeParam(
          data['GPSstatut'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['Observation'],
          ParamType.String,
          false,
        ),
        imagesTask: deserializeParam<String>(
          data['imagesTask'],
          ParamType.String,
          true,
        ),
        etatTache: deserializeParam(
          data['etatTache'],
          ParamType.String,
          false,
        ),
        accessory: deserializeParam<String>(
          data['accessory'],
          ParamType.String,
          true,
        ),
        typeRelais: deserializeParam(
          data['typeRelais'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InstallationSubmitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InstallationSubmitStruct &&
        nomComplet == other.nomComplet &&
        matricule == other.matricule &&
        imei == other.imei &&
        nsim == other.nsim &&
        gPSstatut == other.gPSstatut &&
        observation == other.observation &&
        listEquality.equals(imagesTask, other.imagesTask) &&
        etatTache == other.etatTache &&
        listEquality.equals(accessory, other.accessory) &&
        typeRelais == other.typeRelais;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nomComplet,
        matricule,
        imei,
        nsim,
        gPSstatut,
        observation,
        imagesTask,
        etatTache,
        accessory,
        typeRelais
      ]);
}

InstallationSubmitStruct createInstallationSubmitStruct({
  String? nomComplet,
  String? matricule,
  String? imei,
  String? nsim,
  String? gPSstatut,
  String? observation,
  String? etatTache,
  String? typeRelais,
}) =>
    InstallationSubmitStruct(
      nomComplet: nomComplet,
      matricule: matricule,
      imei: imei,
      nsim: nsim,
      gPSstatut: gPSstatut,
      observation: observation,
      etatTache: etatTache,
      typeRelais: typeRelais,
    );
