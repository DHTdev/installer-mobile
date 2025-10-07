// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TechnicianTaskStruct extends BaseStruct {
  TechnicianTaskStruct({
    int? id,
    int? utiUtilsateurId,
    String? datePrevisionnelleDebut,
    String? dateDebutRealisation,
    String? dateAffectation,
    String? observation,
    int? etatTache,
    String? matricule,
    String? imei,
    String? proprietaire,
    String? gpsPrincipale,
    String? garantie,
    String? sim,
    String? sIMProprietaire,
    String? clientName,
    String? telephoneClient,
    String? cityName,
    String? userName,
    String? catache,
    String? nameModeleGPS,
    String? accesoriesModel,
    String? nameModeleSIM,
    String? vehicules,
  })  : _id = id,
        _utiUtilsateurId = utiUtilsateurId,
        _datePrevisionnelleDebut = datePrevisionnelleDebut,
        _dateDebutRealisation = dateDebutRealisation,
        _dateAffectation = dateAffectation,
        _observation = observation,
        _etatTache = etatTache,
        _matricule = matricule,
        _imei = imei,
        _proprietaire = proprietaire,
        _gpsPrincipale = gpsPrincipale,
        _garantie = garantie,
        _sim = sim,
        _sIMProprietaire = sIMProprietaire,
        _clientName = clientName,
        _telephoneClient = telephoneClient,
        _cityName = cityName,
        _userName = userName,
        _catache = catache,
        _nameModeleGPS = nameModeleGPS,
        _accesoriesModel = accesoriesModel,
        _nameModeleSIM = nameModeleSIM,
        _vehicules = vehicules;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "uti_utilsateur_id" field.
  int? _utiUtilsateurId;
  int get utiUtilsateurId => _utiUtilsateurId ?? 0;
  set utiUtilsateurId(int? val) => _utiUtilsateurId = val;

  void incrementUtiUtilsateurId(int amount) =>
      utiUtilsateurId = utiUtilsateurId + amount;

  bool hasUtiUtilsateurId() => _utiUtilsateurId != null;

  // "date_previsionnelle_debut" field.
  String? _datePrevisionnelleDebut;
  String get datePrevisionnelleDebut => _datePrevisionnelleDebut ?? '';
  set datePrevisionnelleDebut(String? val) => _datePrevisionnelleDebut = val;

  bool hasDatePrevisionnelleDebut() => _datePrevisionnelleDebut != null;

  // "date_debut_realisation" field.
  String? _dateDebutRealisation;
  String get dateDebutRealisation => _dateDebutRealisation ?? '';
  set dateDebutRealisation(String? val) => _dateDebutRealisation = val;

  bool hasDateDebutRealisation() => _dateDebutRealisation != null;

  // "date_affectation" field.
  String? _dateAffectation;
  String get dateAffectation => _dateAffectation ?? '';
  set dateAffectation(String? val) => _dateAffectation = val;

  bool hasDateAffectation() => _dateAffectation != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  set observation(String? val) => _observation = val;

  bool hasObservation() => _observation != null;

  // "etat_tache" field.
  int? _etatTache;
  int get etatTache => _etatTache ?? 0;
  set etatTache(int? val) => _etatTache = val;

  void incrementEtatTache(int amount) => etatTache = etatTache + amount;

  bool hasEtatTache() => _etatTache != null;

  // "matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "IMEI" field.
  String? _imei;
  String get imei => _imei ?? '';
  set imei(String? val) => _imei = val;

  bool hasImei() => _imei != null;

  // "proprietaire" field.
  String? _proprietaire;
  String get proprietaire => _proprietaire ?? '';
  set proprietaire(String? val) => _proprietaire = val;

  bool hasProprietaire() => _proprietaire != null;

  // "gps_principale" field.
  String? _gpsPrincipale;
  String get gpsPrincipale => _gpsPrincipale ?? '';
  set gpsPrincipale(String? val) => _gpsPrincipale = val;

  bool hasGpsPrincipale() => _gpsPrincipale != null;

  // "garantie" field.
  String? _garantie;
  String get garantie => _garantie ?? '';
  set garantie(String? val) => _garantie = val;

  bool hasGarantie() => _garantie != null;

  // "SIM" field.
  String? _sim;
  String get sim => _sim ?? '';
  set sim(String? val) => _sim = val;

  bool hasSim() => _sim != null;

  // "SIM_proprietaire" field.
  String? _sIMProprietaire;
  String get sIMProprietaire => _sIMProprietaire ?? '';
  set sIMProprietaire(String? val) => _sIMProprietaire = val;

  bool hasSIMProprietaire() => _sIMProprietaire != null;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "telephone_client" field.
  String? _telephoneClient;
  String get telephoneClient => _telephoneClient ?? '';
  set telephoneClient(String? val) => _telephoneClient = val;

  bool hasTelephoneClient() => _telephoneClient != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "catache" field.
  String? _catache;
  String get catache => _catache ?? '';
  set catache(String? val) => _catache = val;

  bool hasCatache() => _catache != null;

  // "nameModeleGPS" field.
  String? _nameModeleGPS;
  String get nameModeleGPS => _nameModeleGPS ?? '';
  set nameModeleGPS(String? val) => _nameModeleGPS = val;

  bool hasNameModeleGPS() => _nameModeleGPS != null;

  // "accesoriesModel" field.
  String? _accesoriesModel;
  String get accesoriesModel => _accesoriesModel ?? '';
  set accesoriesModel(String? val) => _accesoriesModel = val;

  bool hasAccesoriesModel() => _accesoriesModel != null;

  // "nameModeleSIM" field.
  String? _nameModeleSIM;
  String get nameModeleSIM => _nameModeleSIM ?? '';
  set nameModeleSIM(String? val) => _nameModeleSIM = val;

  bool hasNameModeleSIM() => _nameModeleSIM != null;

  // "vehicules" field.
  String? _vehicules;
  String get vehicules => _vehicules ?? '';
  set vehicules(String? val) => _vehicules = val;

  bool hasVehicules() => _vehicules != null;

  static TechnicianTaskStruct fromMap(Map<String, dynamic> data) =>
      TechnicianTaskStruct(
        id: castToType<int>(data['id']),
        utiUtilsateurId: castToType<int>(data['uti_utilsateur_id']),
        datePrevisionnelleDebut: data['date_previsionnelle_debut'] as String?,
        dateDebutRealisation: data['date_debut_realisation'] as String?,
        dateAffectation: data['date_affectation'] as String?,
        observation: data['observation'] as String?,
        etatTache: castToType<int>(data['etat_tache']),
        matricule: data['matricule'] as String?,
        imei: data['IMEI'] as String?,
        proprietaire: data['proprietaire'] as String?,
        gpsPrincipale: data['gps_principale'] as String?,
        garantie: data['garantie'] as String?,
        sim: data['SIM'] as String?,
        sIMProprietaire: data['SIM_proprietaire'] as String?,
        clientName: data['client_name'] as String?,
        telephoneClient: data['telephone_client'] as String?,
        cityName: data['cityName'] as String?,
        userName: data['user_name'] as String?,
        catache: data['catache'] as String?,
        nameModeleGPS: data['nameModeleGPS'] as String?,
        accesoriesModel: data['accesoriesModel'] as String?,
        nameModeleSIM: data['nameModeleSIM'] as String?,
        vehicules: data['vehicules'] as String?,
      );

  static TechnicianTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? TechnicianTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'uti_utilsateur_id': _utiUtilsateurId,
        'date_previsionnelle_debut': _datePrevisionnelleDebut,
        'date_debut_realisation': _dateDebutRealisation,
        'date_affectation': _dateAffectation,
        'observation': _observation,
        'etat_tache': _etatTache,
        'matricule': _matricule,
        'IMEI': _imei,
        'proprietaire': _proprietaire,
        'gps_principale': _gpsPrincipale,
        'garantie': _garantie,
        'SIM': _sim,
        'SIM_proprietaire': _sIMProprietaire,
        'client_name': _clientName,
        'telephone_client': _telephoneClient,
        'cityName': _cityName,
        'user_name': _userName,
        'catache': _catache,
        'nameModeleGPS': _nameModeleGPS,
        'accesoriesModel': _accesoriesModel,
        'nameModeleSIM': _nameModeleSIM,
        'vehicules': _vehicules,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'uti_utilsateur_id': serializeParam(
          _utiUtilsateurId,
          ParamType.int,
        ),
        'date_previsionnelle_debut': serializeParam(
          _datePrevisionnelleDebut,
          ParamType.String,
        ),
        'date_debut_realisation': serializeParam(
          _dateDebutRealisation,
          ParamType.String,
        ),
        'date_affectation': serializeParam(
          _dateAffectation,
          ParamType.String,
        ),
        'observation': serializeParam(
          _observation,
          ParamType.String,
        ),
        'etat_tache': serializeParam(
          _etatTache,
          ParamType.int,
        ),
        'matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'IMEI': serializeParam(
          _imei,
          ParamType.String,
        ),
        'proprietaire': serializeParam(
          _proprietaire,
          ParamType.String,
        ),
        'gps_principale': serializeParam(
          _gpsPrincipale,
          ParamType.String,
        ),
        'garantie': serializeParam(
          _garantie,
          ParamType.String,
        ),
        'SIM': serializeParam(
          _sim,
          ParamType.String,
        ),
        'SIM_proprietaire': serializeParam(
          _sIMProprietaire,
          ParamType.String,
        ),
        'client_name': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'telephone_client': serializeParam(
          _telephoneClient,
          ParamType.String,
        ),
        'cityName': serializeParam(
          _cityName,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'catache': serializeParam(
          _catache,
          ParamType.String,
        ),
        'nameModeleGPS': serializeParam(
          _nameModeleGPS,
          ParamType.String,
        ),
        'accesoriesModel': serializeParam(
          _accesoriesModel,
          ParamType.String,
        ),
        'nameModeleSIM': serializeParam(
          _nameModeleSIM,
          ParamType.String,
        ),
        'vehicules': serializeParam(
          _vehicules,
          ParamType.String,
        ),
      }.withoutNulls;

  static TechnicianTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TechnicianTaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        utiUtilsateurId: deserializeParam(
          data['uti_utilsateur_id'],
          ParamType.int,
          false,
        ),
        datePrevisionnelleDebut: deserializeParam(
          data['date_previsionnelle_debut'],
          ParamType.String,
          false,
        ),
        dateDebutRealisation: deserializeParam(
          data['date_debut_realisation'],
          ParamType.String,
          false,
        ),
        dateAffectation: deserializeParam(
          data['date_affectation'],
          ParamType.String,
          false,
        ),
        observation: deserializeParam(
          data['observation'],
          ParamType.String,
          false,
        ),
        etatTache: deserializeParam(
          data['etat_tache'],
          ParamType.int,
          false,
        ),
        matricule: deserializeParam(
          data['matricule'],
          ParamType.String,
          false,
        ),
        imei: deserializeParam(
          data['IMEI'],
          ParamType.String,
          false,
        ),
        proprietaire: deserializeParam(
          data['proprietaire'],
          ParamType.String,
          false,
        ),
        gpsPrincipale: deserializeParam(
          data['gps_principale'],
          ParamType.String,
          false,
        ),
        garantie: deserializeParam(
          data['garantie'],
          ParamType.String,
          false,
        ),
        sim: deserializeParam(
          data['SIM'],
          ParamType.String,
          false,
        ),
        sIMProprietaire: deserializeParam(
          data['SIM_proprietaire'],
          ParamType.String,
          false,
        ),
        clientName: deserializeParam(
          data['client_name'],
          ParamType.String,
          false,
        ),
        telephoneClient: deserializeParam(
          data['telephone_client'],
          ParamType.String,
          false,
        ),
        cityName: deserializeParam(
          data['cityName'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        catache: deserializeParam(
          data['catache'],
          ParamType.String,
          false,
        ),
        nameModeleGPS: deserializeParam(
          data['nameModeleGPS'],
          ParamType.String,
          false,
        ),
        accesoriesModel: deserializeParam(
          data['accesoriesModel'],
          ParamType.String,
          false,
        ),
        nameModeleSIM: deserializeParam(
          data['nameModeleSIM'],
          ParamType.String,
          false,
        ),
        vehicules: deserializeParam(
          data['vehicules'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TechnicianTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TechnicianTaskStruct &&
        id == other.id &&
        utiUtilsateurId == other.utiUtilsateurId &&
        datePrevisionnelleDebut == other.datePrevisionnelleDebut &&
        dateDebutRealisation == other.dateDebutRealisation &&
        dateAffectation == other.dateAffectation &&
        observation == other.observation &&
        etatTache == other.etatTache &&
        matricule == other.matricule &&
        imei == other.imei &&
        proprietaire == other.proprietaire &&
        gpsPrincipale == other.gpsPrincipale &&
        garantie == other.garantie &&
        sim == other.sim &&
        sIMProprietaire == other.sIMProprietaire &&
        clientName == other.clientName &&
        telephoneClient == other.telephoneClient &&
        cityName == other.cityName &&
        userName == other.userName &&
        catache == other.catache &&
        nameModeleGPS == other.nameModeleGPS &&
        accesoriesModel == other.accesoriesModel &&
        nameModeleSIM == other.nameModeleSIM &&
        vehicules == other.vehicules;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        utiUtilsateurId,
        datePrevisionnelleDebut,
        dateDebutRealisation,
        dateAffectation,
        observation,
        etatTache,
        matricule,
        imei,
        proprietaire,
        gpsPrincipale,
        garantie,
        sim,
        sIMProprietaire,
        clientName,
        telephoneClient,
        cityName,
        userName,
        catache,
        nameModeleGPS,
        accesoriesModel,
        nameModeleSIM,
        vehicules
      ]);
}

TechnicianTaskStruct createTechnicianTaskStruct({
  int? id,
  int? utiUtilsateurId,
  String? datePrevisionnelleDebut,
  String? dateDebutRealisation,
  String? dateAffectation,
  String? observation,
  int? etatTache,
  String? matricule,
  String? imei,
  String? proprietaire,
  String? gpsPrincipale,
  String? garantie,
  String? sim,
  String? sIMProprietaire,
  String? clientName,
  String? telephoneClient,
  String? cityName,
  String? userName,
  String? catache,
  String? nameModeleGPS,
  String? accesoriesModel,
  String? nameModeleSIM,
  String? vehicules,
}) =>
    TechnicianTaskStruct(
      id: id,
      utiUtilsateurId: utiUtilsateurId,
      datePrevisionnelleDebut: datePrevisionnelleDebut,
      dateDebutRealisation: dateDebutRealisation,
      dateAffectation: dateAffectation,
      observation: observation,
      etatTache: etatTache,
      matricule: matricule,
      imei: imei,
      proprietaire: proprietaire,
      gpsPrincipale: gpsPrincipale,
      garantie: garantie,
      sim: sim,
      sIMProprietaire: sIMProprietaire,
      clientName: clientName,
      telephoneClient: telephoneClient,
      cityName: cityName,
      userName: userName,
      catache: catache,
      nameModeleGPS: nameModeleGPS,
      accesoriesModel: accesoriesModel,
      nameModeleSIM: nameModeleSIM,
      vehicules: vehicules,
    );
