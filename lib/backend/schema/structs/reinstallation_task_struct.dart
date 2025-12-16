// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReinstallationTaskStruct extends BaseStruct {
  ReinstallationTaskStruct({
    String? newMatricule,
    String? nsim,
    int? statut,
    String? imei,
    List<String>? images,
  })  : _newMatricule = newMatricule,
        _nsim = nsim,
        _statut = statut,
        _imei = imei,
        _images = images;

  // "NewMatricule" field.
  String? _newMatricule;
  String get newMatricule => _newMatricule ?? '';
  set newMatricule(String? val) => _newMatricule = val;

  bool hasNewMatricule() => _newMatricule != null;

  // "NSIM" field.
  String? _nsim;
  String get nsim => _nsim ?? '';
  set nsim(String? val) => _nsim = val;

  bool hasNsim() => _nsim != null;

  // "statut" field.
  int? _statut;
  int get statut => _statut ?? 0;
  set statut(int? val) => _statut = val;

  void incrementStatut(int amount) => statut = statut + amount;

  bool hasStatut() => _statut != null;

  // "IMEI" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  static ReinstallationTaskStruct fromMap(Map<String, dynamic> data) =>
      ReinstallationTaskStruct(
        newMatricule: data['NewMatricule'] as String?,
        nsim: data['NSIM'] as String?,
        statut: castToType<int>(data['statut']),
        imei: data['IMEI'] as String?,
        images: getDataList(data['images']),
      );

  static ReinstallationTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? ReinstallationTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'NewMatricule': _newMatricule,
        'NSIM': _nsim,
        'statut': _statut,
        'IMEI': _imei,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NewMatricule': serializeParam(
          _newMatricule,
          ParamType.String,
        ),
        'NSIM': serializeParam(
          _nsim,
          ParamType.String,
        ),
        'statut': serializeParam(
          _statut,
          ParamType.int,
        ),
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ReinstallationTaskStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ReinstallationTaskStruct(
        newMatricule: deserializeParam(
          data['NewMatricule'],
          ParamType.String,
          false,
        ),
        nsim: deserializeParam(
          data['NSIM'],
          ParamType.String,
          false,
        ),
        statut: deserializeParam(
          data['statut'],
          ParamType.int,
          false,
        ),
        imei: deserializeParam(
          data['IMEI'],
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
  String toString() => 'ReinstallationTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ReinstallationTaskStruct &&
        newMatricule == other.newMatricule &&
        nsim == other.nsim &&
        statut == other.statut &&
        imei == other.imei &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([newMatricule, nsim, statut, imei, images]);
}

ReinstallationTaskStruct createReinstallationTaskStruct({
  String? newMatricule,
  String? nsim,
  int? statut,
  String? imei,
}) =>
    ReinstallationTaskStruct(
      newMatricule: newMatricule,
      nsim: nsim,
      statut: statut,
      imei: imei,
    );
