// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanneSimSubmitStruct extends BaseStruct {
  PanneSimSubmitStruct({
    String? imei,
    String? observation,
    String? ancienSIM,
    String? nouveauSim,
    String? matricule,
    List<Map<String, dynamic>>? images,
  })  : _imei = imei,
        _observation = observation,
        _ancienSIM = ancienSIM,
        _nouveauSim = nouveauSim,
        _matricule = matricule,
        _images = images;

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

  // "AncienSIM" field.
  String? _ancienSIM;
  String get ancienSIM => _ancienSIM ?? '';
  set ancienSIM(String? val) => _ancienSIM = val;

  bool hasAncienSIM() => _ancienSIM != null;

  // "NouveauSim" field.
  String? _nouveauSim;
  String get nouveauSim => _nouveauSim ?? '';
  set nouveauSim(String? val) => _nouveauSim = val;

  bool hasNouveauSim() => _nouveauSim != null;

  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "images" field.
  List<Map<String, dynamic>>? _images;
  List<Map<String, dynamic>>? get images => _images;
  set images(List<Map<String, dynamic>>? val) => _images = [
        {"data": val, "extension": "jpg"}
      ];

  // bool hasImages() => _images != null;

  static PanneSimSubmitStruct fromMap(Map<String, dynamic> data) => PanneSimSubmitStruct(
        imei: data['IMEI'] as String?,
        observation: data['Observation'] as String?,
        ancienSIM: data['AncienSIM'] as String?,
        nouveauSim: data['NouveauSim'] as String?,
        matricule: data['Matricule'] as String?,
        images: getDataList(data['images']),
      );

  static PanneSimSubmitStruct? maybeFromMap(dynamic data) => data is Map ? PanneSimSubmitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'IMEI': _imei,
        'Observation': _observation,
        'AncienSIM': _ancienSIM,
        'NouveauSim': _nouveauSim,
        'Matricule': _matricule,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'Observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'AncienSIM': serializeParam(
          _ancienSIM,
          ParamType.String,
        ),
        'NouveauSim': serializeParam(
          _nouveauSim,
          ParamType.String,
        ),
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
        ),
      }.withoutNulls;

  static PanneSimSubmitStruct fromSerializableMap(Map<String, dynamic> data) => PanneSimSubmitStruct(
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
        ancienSIM: deserializeParam(
          data['AncienSIM'],
          ParamType.String,
          false,
        ),
        nouveauSim: deserializeParam(
          data['NouveauSim'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['Matricule'],
          ParamType.String,
          false,
        ),
        images: deserializeParam(
          data['images'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PanneSimSubmitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PanneSimSubmitStruct &&
        imei == other.imei &&
        observation == other.observation &&
        ancienSIM == other.ancienSIM &&
        nouveauSim == other.nouveauSim &&
        matricule == other.matricule &&
        images == other.images;
  }

  @override
  int get hashCode => const ListEquality().hash([imei, observation, ancienSIM, nouveauSim, matricule, images]);
}

PanneSimSubmitStruct createPanneSimSubmitStruct({
  String? imei,
  String? observation,
  String? ancienSIM,
  String? nouveauSim,
  String? matricule,
  // String? images,
}) =>
    PanneSimSubmitStruct(
      imei: imei,
      observation: observation,
      ancienSIM: ancienSIM,
      nouveauSim: nouveauSim,
      matricule: matricule,
      // images: images,
    );
