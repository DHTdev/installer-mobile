// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanneRelaisSubmitStruct extends BaseStruct {
  PanneRelaisSubmitStruct({
    String? IMEI,
    String? matricule,
    String? observation,
    String? typeRelais,
    List<Map<String, dynamic>>? images,
  })  : _IMEI = IMEI,
        _matricule = matricule,
        _observation = observation,
        _typeRelais = typeRelais,
        _images = images;

  // "IMEI" field.
  String? _IMEI;
  String get IMEI => _IMEI ?? '';
  set IMEI(String? val) => _IMEI = val;

  bool hasIMEI() => _IMEI != null;

  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;


  // "Observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

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

  // "typeRelais" field.
  String? _typeRelais;
  String get typeRelais => _typeRelais ?? '';
  set typeRelais(String? val) => _typeRelais = val;

  bool hasTypeRelais() => _typeRelais != null;
  static PanneRelaisSubmitStruct fromMap(Map<String, dynamic> data) => PanneRelaisSubmitStruct(
        IMEI: data['IMEI'] as String?,
        matricule: data['Matricule'] as String?,
        observation: data['Observation'] as String?,
        typeRelais: data['typeRelais'] as String?,
        images: getDataList(data['images']),
      );

  static PanneRelaisSubmitStruct? maybeFromMap(dynamic data) => data is Map ? PanneRelaisSubmitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'IMEI': _IMEI,
        'Matricule': _matricule,
        'Observation': _observation,
        'typeRelais': _typeRelais,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'IMEI': serializeParam(
          _IMEI,
          ParamType.String,
        ),
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'Observation': serializeParam(
          _observation,
          ParamType.String,
        ),

        'typeRelais': serializeParam(
          _typeRelais,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PanneRelaisSubmitStruct fromSerializableMap(Map<String, dynamic> data) => PanneRelaisSubmitStruct(
        IMEI: deserializeParam(
          data['IMEI'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['Matricule'],
          ParamType.String,
          false,
        ),

        observation: deserializeParam(
          data['Observation'],
          ParamType.String,
          false,
        ),

        typeRelais: deserializeParam(
          data['typeRelais'],
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
  String toString() => 'PanneRelaisSubmitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PanneRelaisSubmitStruct &&
        IMEI == other.IMEI &&
        matricule == other.matricule &&
        observation == other.observation &&
        typeRelais == other.typeRelais &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([IMEI, matricule, observation, images, typeRelais]);
}

PanneRelaisSubmitStruct createPanneRelaisSubmitStruct({
  String? IMEI,
  String? matricule,
  String? ancienneIMEI,
  String? nsim,
  String? observation,
  String? special,
  bool? statut,
  String? typeRelais,
  List<Map<String, dynamic>>? images,
}) =>
    PanneRelaisSubmitStruct(
      IMEI: IMEI,
      matricule: matricule,
      observation: observation,
      typeRelais: typeRelais,
      images: images,
    );
