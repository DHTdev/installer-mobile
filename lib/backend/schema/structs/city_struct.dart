// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityStruct extends BaseStruct {
  CityStruct({
    int? id,
    String? cityName,
  })  : _id = id,
        _cityName = cityName;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  static CityStruct fromMap(Map<String, dynamic> data) => CityStruct(
        id: castToType<int>(data['id']),
        cityName: data['cityName'] as String?,
      );

  static CityStruct? maybeFromMap(dynamic data) =>
      data is Map ? CityStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cityName': _cityName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'cityName': serializeParam(
          _cityName,
          ParamType.String,
        ),
      }.withoutNulls;

  static CityStruct fromSerializableMap(Map<String, dynamic> data) =>
      CityStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cityName: deserializeParam(
          data['cityName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CityStruct && id == other.id && cityName == other.cityName;
  }

  @override
  int get hashCode => const ListEquality().hash([id, cityName]);
}

CityStruct createCityStruct({
  int? id,
  String? cityName,
}) =>
    CityStruct(
      id: id,
      cityName: cityName,
    );
