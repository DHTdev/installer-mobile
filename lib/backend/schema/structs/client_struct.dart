// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientStruct extends BaseStruct {
  ClientStruct({
    int? id,
    int? cityId,
    String? city,
    String? clientname,
    String? telephoneClient,
    String? email,
    String? createdAt,
  })  : _id = id,
        _cityId = cityId,
        _city = city,
        _clientname = clientname,
        _telephoneClient = telephoneClient,
        _email = email,
        _createdAt = createdAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "clientname" field.
  String? _clientname;
  String get clientname => _clientname ?? '';
  set clientname(String? val) => _clientname = val;

  bool hasClientname() => _clientname != null;

  // "telephone_client" field.
  String? _telephoneClient;
  String get telephoneClient => _telephoneClient ?? "";
  set telephoneClient(String? val) => _telephoneClient = val;

  // void incrementTelephoneClient(int amount) =>
  //     telephoneClient = telephoneClient + amount;

  bool hasTelephoneClient() => _telephoneClient != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "created_at" field.
  String? _createdAt;
  String? get createdAt => _createdAt;
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static ClientStruct fromMap(Map<String, dynamic> data) => ClientStruct(
        id: castToType<int>(data['id']),
        cityId: castToType<int>(data['city_id']),
        city: data['city'] != null ? data['city']['cityName'] as String : null,
        clientname: data['nomComplet'] as String?,
        telephoneClient: data['telephone_client'],
        email: data['email'] as String?,
        createdAt: data['created_at'],
      );

  static ClientStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClientStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'city_id': _cityId,
        'city': _city,
        'clientname': _clientname,
        'telephone_client': _telephoneClient,
        'email': _email,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'clientname': serializeParam(
          _clientname,
          ParamType.String,
        ),
        'telephone_client': serializeParam(
          _telephoneClient,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClientStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClientStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        clientname: deserializeParam(
          data['clientname'],
          ParamType.String,
          false,
        ),
        telephoneClient: deserializeParam(
          data['telephone_client'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClientStruct &&
        id == other.id &&
        cityId == other.cityId &&
        city == other.city &&
        clientname == other.clientname &&
        telephoneClient == other.telephoneClient &&
        email == other.email &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, cityId, city, clientname, telephoneClient, email, createdAt]);
}

ClientStruct createClientStruct({
  int? id,
  int? cityId,
  String? city,
  String? clientname,
  String? telephoneClient,
  String? email,
  String? createdAt,
}) =>
    ClientStruct(
      id: id,
      cityId: cityId,
      city: city,
      clientname: clientname,
      telephoneClient: telephoneClient,
      email: email,
      createdAt: createdAt,
    );
