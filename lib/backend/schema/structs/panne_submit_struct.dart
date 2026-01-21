import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/flutter_flow/flutter_flow_util.dart';
import 'package:mobile_installer/flutter_flow/nav/serialization_util.dart';

class PanneSubmitStruct extends BaseStruct {
  PanneSubmitStruct({
    String? imei,
    String? observation,
    String? matricule,
    List<Map<String, dynamic>>? images,
  })  : _imei = imei,
        _observation = observation,
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
  // "Matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;
  // "images" field.

  List<Map<String, dynamic>>? _images;
  List<Map<String, dynamic>>? get images => _images;
  set images(List<Map<String, dynamic>>? val) => _images = [
        {"data": val, "extension": "jpg"}
      ];

  static PanneSubmitStruct fromMap(Map<String, dynamic> data) => PanneSubmitStruct(
        imei: data['IMEI'] as String?,
        observation: data['Observation'] as String?,
        matricule: data['Matricule'] as String?,
        images: getDataList(data['images']),
      );

  static PanneSubmitStruct? maybeFromMap(dynamic data) => data is Map ? PanneSubmitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        "IMEI": imei,
        "Observation": observation,
        "Matricule": matricule,
        "images": images,
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
        'Matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
        ),
      }.withoutNulls;

  static PanneSubmitStruct fromSerializableMap(Map<String, dynamic> data) => PanneSubmitStruct(
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
    return other is PanneSubmitStruct && imei == other.imei && observation == other.observation && matricule == other.matricule && images == other.images;
  }

  @override
  int get hashCode => const ListEquality().hash([imei, observation, matricule, images]);
}
