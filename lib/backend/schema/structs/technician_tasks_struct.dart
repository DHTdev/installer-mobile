// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// all tasks of technician programme
class TechnicianTaskStruct extends BaseStruct {
  TechnicianTaskStruct({
    int? id,
    int? IMEI,
    int? SIM,
    bool? SIM_proprietaire,
    String? accesoriesModel,
    String? catache,
    String? cityName,
    String? clientName,
    DateTime? date_affectation,
    DateTime? date_debut_realisation,
    DateTime? date_previsionnelle_debut,
    int? etatTache,
    String? garantie,
    bool? gps_principale,
    String? matricule,
    String? nameModeleGPS,
    String? nameModeleSIM,
    String? observation,
    bool? proprietaire,
    String? clientPhoneNumber,
  })  : _id = id,
        _IMEI = IMEI,
        _SIM = SIM,
        _SIM_proprietaire = SIM_proprietaire,
        _accesoriesModel = accesoriesModel,
        _catache = catache,
        _cityName = cityName,
        _clientName = clientName,
        _date_affectation = date_affectation,
        _date_debut_realisation = date_debut_realisation,
        _date_previsionnelle_debut = date_previsionnelle_debut,
        _etatTache = etatTache,
        _garantie = garantie,
        _gps_principale = gps_principale,
        _matricule = matricule,
        _nameModeleGPS = nameModeleGPS,
        _nameModeleSIM = nameModeleSIM,
        _observation = observation,
        _proprietaire = proprietaire,
        _clientPhoneNumber = clientPhoneNumber;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "IMEI" field.
  int? _IMEI;
  int get IMEI => _IMEI ?? 0;
  set IMEI(int? val) => _IMEI = val;

  void incrementIMEI(int amount) => IMEI = IMEI + amount;

  bool hasIMEI() => _IMEI != null;

  // "SIM" field.
  int? _SIM;
  int get SIM => _SIM ?? 0;
  set SIM(int? val) => _SIM = val;

  void incrementSIM(int amount) => SIM = SIM + amount;

  bool hasSIM() => _SIM != null;

  // "SIM_proprietaire" field.
  bool? _SIM_proprietaire;
  bool get SIM_proprietaire => _SIM_proprietaire ?? false;
  set SIM_proprietaire(bool? val) => _SIM_proprietaire = val;

  bool hasSIM_proprietaire() => _SIM_proprietaire != null;

  // "accesoriesModel" field.
  String? _accesoriesModel;
  String get accesoriesModel => _accesoriesModel ?? '';
  set accesoriesModel(String? val) => _accesoriesModel = val;

  bool hasAccesoriesModel() => _accesoriesModel != null;

  // "catache" field.
  String? _catache;
  String get catache => _catache ?? '';
  set catache(String? val) => _catache = val;

  bool hasCatache() => _catache != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "date_affectation" field.
  DateTime? _date_affectation;
  DateTime? get date_affectation => _date_affectation;
  set date_affectation(DateTime? val) => _date_affectation = val;

  bool hasdate_affectation() => _date_affectation != null;

  // "date_debut_realisation" field.
  DateTime? _date_debut_realisation;
  DateTime? get date_debut_realisation => _date_debut_realisation;
  set date_debut_realisation(DateTime? val) => _date_debut_realisation = val;

  bool hasdate_debut_realisation() => _date_debut_realisation != null;

  // "date_previsionnelle_debut" field.
  DateTime? _date_previsionnelle_debut;
  DateTime? get date_previsionnelle_debut => _date_previsionnelle_debut;
  set date_previsionnelle_debut(DateTime? val) =>
      _date_previsionnelle_debut = val;

  bool hasdate_previsionnelle_debut() => _date_previsionnelle_debut != null;

  // "etatTache" field.
  int? _etatTache;
  int get etatTache => _etatTache ?? 0;
  set etatTache(int? val) => _etatTache = val;

  void incrementetatTache(int amount) => etatTache = etatTache + amount;

  bool hasetatTache() => _etatTache != null;

  // "garantie" field.
  String? _garantie;
  String get garantie => _garantie ?? '';
  set garantie(String? val) => _garantie = val;

  bool hasGarantie() => _garantie != null;

  // "gps_principale" field.
  bool? _gps_principale;
  bool get gps_principale => _gps_principale ?? false;
  set gps_principale(bool? val) => _gps_principale = val;

  bool hasgps_principale() => _gps_principale != null;

  // "matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "nameModeleGPS" field.
  String? _nameModeleGPS;
  String get nameModeleGPS => _nameModeleGPS ?? '';
  set nameModeleGPS(String? val) => _nameModeleGPS = val;

  bool hasNameModeleGPS() => _nameModeleGPS != null;

  // "nameModeleSIM" field.
  String? _nameModeleSIM;
  String get nameModeleSIM => _nameModeleSIM ?? '';
  set nameModeleSIM(String? val) => _nameModeleSIM = val;

  bool hasNameModeleSIM() => _nameModeleSIM != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "proprietaire" field.
  bool? _proprietaire;
  bool get proprietaire => _proprietaire ?? false;
  set proprietaire(bool? val) => _proprietaire = val;

  bool hasproprietaire() => _proprietaire != null;

  // "clientPhoneNumber" field.
  String? _clientPhoneNumber;
  String get clientPhoneNumber => _clientPhoneNumber ?? "";
  set clientPhoneNumber(String? val) => _clientPhoneNumber = val;

  void incrementClientPhoneNumber(String amount) =>
      clientPhoneNumber = clientPhoneNumber + amount;

  bool hasClientPhoneNumber() => _clientPhoneNumber != null;

  static TechnicianTaskStruct fromMap(Map<String, dynamic> data) =>
      TechnicianTaskStruct(
        id: castToType<int>(data['id']),
        IMEI: castToType<int>(data['IMEI']),
        SIM: castToType<int>(data['SIM']),
        SIM_proprietaire: data['SIM_proprietaire'] as bool?,
        accesoriesModel: data['accesoriesModel'] as String?,
        catache: data['catache'] as String?,
        cityName: data['cityName'] as String?,
        clientName: data['client_name'] as String?,
        date_affectation: DateTime.parse(data['date_affectation']),
        date_debut_realisation: data['date_debut_realisation'] != null ?
            DateTime.parse(data['date_debut_realisation']) : null,
        date_previsionnelle_debut:
            DateTime.parse(data['date_previsionnelle_debut']),
        etatTache: castToType<int>(data['etatTache']),
        garantie: data['garantie'] as String?,
        gps_principale: data['gps_principale'] as bool?,
        matricule: data['matricule'] as String?,
        nameModeleGPS: data['nameModeleGPS'] as String?,
        nameModeleSIM: data['nameModeleSIM'] as String?,
        observation: data['observation'] as String?,
        proprietaire: data['proprietaire'] as bool?,
        clientPhoneNumber: data['telephone_client'] as String?,
      );

  static TechnicianTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? TechnicianTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'IMEI': _IMEI,
        'SIM': _SIM,
        'SIM_proprietaire': _SIM_proprietaire,
        'accesoriesModel': _accesoriesModel,
        'catache': _catache,
        'cityName': _cityName,
        'clientName': _clientName,
        'date_affectation': _date_affectation,
        'date_debut_realisation': _date_debut_realisation,
        'date_previsionnelle_debut': _date_previsionnelle_debut,
        'etatTache': _etatTache,
        'garantie': _garantie,
        'gps_principale': _gps_principale,
        'matricule': _matricule,
        'nameModeleGPS': _nameModeleGPS,
        'nameModeleSIM': _nameModeleSIM,
        'observation': _observation,
        'proprietaire': _proprietaire,
        'clientPhoneNumber': _clientPhoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'IMEI': serializeParam(
          _IMEI,
          ParamType.int,
        ),
        'SIM': serializeParam(
          _SIM,
          ParamType.int,
        ),
        'SIM_proprietaire': serializeParam(
          _SIM_proprietaire,
          ParamType.bool,
        ),
        'accesoriesModel': serializeParam(
          _accesoriesModel,
          ParamType.String,
        ),
        'catache': serializeParam(
          _catache,
          ParamType.String,
        ),
        'cityName': serializeParam(
          _cityName,
          ParamType.String,
        ),
        'clientName': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'date_affectation': serializeParam(
          _date_affectation,
          ParamType.DateTime,
        ),
        'date_debut_realisation': serializeParam(
          _date_debut_realisation,
          ParamType.DateTime,
        ),
        'date_previsionnelle_debut': serializeParam(
          _date_previsionnelle_debut,
          ParamType.DateTime,
        ),
        'etatTache': serializeParam(
          _etatTache,
          ParamType.int,
        ),
        'garantie': serializeParam(
          _garantie,
          ParamType.String,
        ),
        'gps_principale': serializeParam(
          _gps_principale,
          ParamType.bool,
        ),
        'matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'nameModeleGPS': serializeParam(
          _nameModeleGPS,
          ParamType.String,
        ),
        'nameModeleSIM': serializeParam(
          _nameModeleSIM,
          ParamType.String,
        ),
        'observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'proprietaire': serializeParam(
          _proprietaire,
          ParamType.bool,
        ),
        'clientPhoneNumber': serializeParam(
          _clientPhoneNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static TechnicianTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TechnicianTaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        IMEI: deserializeParam(
          data['IMEI'],
          ParamType.int,
          false,
        ),
        SIM: deserializeParam(
          data['SIM'],
          ParamType.int,
          false,
        ),
        SIM_proprietaire: deserializeParam(
          data['SIM_proprietaire'],
          ParamType.bool,
          false,
        ),
        accesoriesModel: deserializeParam(
          data['accesoriesModel'],
          ParamType.String,
          false,
        ),
        catache: deserializeParam(
          data['catache'],
          ParamType.String,
          false,
        ),
        cityName: deserializeParam(
          data['cityName'],
          ParamType.String,
          false,
        ),
        clientName: deserializeParam(
          data['clientName'],
          ParamType.String,
          false,
        ),
        date_affectation: deserializeParam(
          data['date_affectation'],
          ParamType.DateTime,
          false,
        ),
        date_debut_realisation: deserializeParam(
          data['date_debut_realisation'],
          ParamType.DateTime,
          false,
        ),
        date_previsionnelle_debut: deserializeParam(
          data['date_previsionnelle_debut'],
          ParamType.DateTime,
          false,
        ),
        etatTache: deserializeParam(
          data['etatTache'],
          ParamType.int,
          false,
        ),
        garantie: deserializeParam(
          data['garantie'],
          ParamType.String,
          false,
        ),
        gps_principale: deserializeParam(
          data['gps_principale'],
          ParamType.bool,
          false,
        ),
        matricule: deserializeParam(
          data['matricule'],
          ParamType.String,
          false,
        ),
        nameModeleGPS: deserializeParam(
          data['nameModeleGPS'],
          ParamType.String,
          false,
        ),
        nameModeleSIM: deserializeParam(
          data['nameModeleSIM'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['observation'],
          ParamType.String,
          false,
        ),
        proprietaire: deserializeParam(
          data['proprietaire'],
          ParamType.bool,
          false,
        ),
        clientPhoneNumber: deserializeParam(
          data['clientPhoneNumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TechnicianTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TechnicianTaskStruct &&
        id == other.id &&
        IMEI == other.IMEI &&
        SIM == other.SIM &&
        SIM_proprietaire == other.SIM_proprietaire &&
        accesoriesModel == other.accesoriesModel &&
        catache == other.catache &&
        cityName == other.cityName &&
        clientName == other.clientName &&
        date_affectation == other.date_affectation &&
        date_debut_realisation == other.date_debut_realisation &&
        date_previsionnelle_debut == other.date_previsionnelle_debut &&
        etatTache == other.etatTache &&
        garantie == other.garantie &&
        gps_principale == other.gps_principale &&
        matricule == other.matricule &&
        nameModeleGPS == other.nameModeleGPS &&
        nameModeleSIM == other.nameModeleSIM &&
        observation == other.observation &&
        proprietaire == other.proprietaire &&
        clientPhoneNumber == other.clientPhoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        IMEI,
        SIM,
        SIM_proprietaire,
        accesoriesModel,
        catache,
        cityName,
        clientName,
        date_affectation,
        date_debut_realisation,
        date_previsionnelle_debut,
        etatTache,
        garantie,
        gps_principale,
        matricule,
        nameModeleGPS,
        nameModeleSIM,
        observation,
        proprietaire,
        clientPhoneNumber
      ]);
}

TechnicianTaskStruct createTechnicianTaskStruct({
  int? id,
  int? IMEI,
  int? SIM,
  bool? SIM_proprietaire,
  String? accesoriesModel,
  String? catache,
  String? cityName,
  String? clientName,
  DateTime? date_affectation,
  DateTime? date_debut_realisation,
  DateTime? date_previsionnelle_debut,
  int? etatTache,
  String? garantie,
  bool? gps_principale,
  String? matricule,
  String? nameModeleGPS,
  String? nameModeleSIM,
  String? observation,
  bool? proprietaire,
  String? clientPhoneNumber,
}) =>
    TechnicianTaskStruct(
      id: id,
      IMEI: IMEI,
      SIM: SIM,
      SIM_proprietaire: SIM_proprietaire,
      accesoriesModel: accesoriesModel,
      catache: catache,
      cityName: cityName,
      clientName: clientName,
      date_affectation: date_affectation,
      date_debut_realisation: date_debut_realisation,
      date_previsionnelle_debut: date_previsionnelle_debut,
      etatTache: etatTache,
      garantie: garantie,
      gps_principale: gps_principale,
      matricule: matricule,
      nameModeleGPS: nameModeleGPS,
      nameModeleSIM: nameModeleSIM,
      observation: observation,
      proprietaire: proprietaire,
      clientPhoneNumber: clientPhoneNumber,
    );
