import 'package:flutter/material.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  late SharedPreferences prefs;

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
      _userId = prefs.getInt('ff_userId') ?? _userId;
      _userName = prefs.getString('ff_userName') ?? _userName;
      _userEmail = prefs.getString('ff_userEmail') ?? _userEmail;
      _userTelephone = prefs.getString('ff_userTelephone') ?? _userTelephone;
      _userProfilId = prefs.getInt('ff_userProfilId') ?? _userProfilId;
      _userIsActive = prefs.getBool('ff_userIsActive') ?? _userIsActive;
      _tokenExpiresAt = prefs.getString('ff_tokenExpiresAt') ?? _tokenExpiresAt;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  void _safeInit(VoidCallback initializeField) {
    try {
      initializeField();
    } catch (_) {}
  }

  // Auth Token
  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
  }

  // User ID
  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    prefs.setInt('ff_userId', value);
  }

  // User Name
  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  // User Email
  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
    prefs.setString('ff_userEmail', value);
  }

  // User Telephone
  String _userTelephone = '';
  String get userTelephone => _userTelephone;
  set userTelephone(String value) {
    _userTelephone = value;
    prefs.setString('ff_userTelephone', value);
  }

  // User Profil ID
  int _userProfilId = 0;
  int get userProfilId => _userProfilId;
  set userProfilId(int value) {
    _userProfilId = value;
    prefs.setInt('ff_userProfilId', value);
  }

  // User Is Active
  bool _userIsActive = false;
  bool get userIsActive => _userIsActive;
  set userIsActive(bool value) {
    _userIsActive = value;
    prefs.setBool('ff_userIsActive', value);
  }

  // Token Expires At
  String _tokenExpiresAt = '';
  String get tokenExpiresAt => _tokenExpiresAt;
  set tokenExpiresAt(String value) {
    _tokenExpiresAt = value;
    prefs.setString('ff_tokenExpiresAt', value);
  }

  // Devices GPS
  List<GpsStruct> _devicesGps = [];
  List<GpsStruct> get devicesGps => _devicesGps;
  set devicesGps(List<GpsStruct> value) {
    _devicesGps = value;
  }

  // Devices SIM
  List<SimStruct> _devicesSim = [];
  List<SimStruct> get devicesSim => _devicesSim;
  set devicesSim(List<SimStruct> value) {
    _devicesSim = value;
  }

  // Devices Accessory
  List<AccessoryStruct> _devicesAccessory = [];
  List<AccessoryStruct> get devicesAccessory => _devicesAccessory;
  set devicesAccessory(List<AccessoryStruct> value) {
    _devicesAccessory = value;
  }

  // Header Response
  dynamic _headerResponse;
  dynamic get headerResponse => _headerResponse;
  set headerResponse(dynamic value) {
    _headerResponse = value;
  }

  // Méthode pour nettoyer toutes les données utilisateur
  void clearUserData() {
    _authToken = '';
    _userId = 0;
    _userName = '';
    _userEmail = '';
    _userTelephone = '';
    _userProfilId = 0;
    _userIsActive = false;
    _tokenExpiresAt = '';
    _devicesGps = [];
    _devicesSim = [];
    _devicesAccessory = [];
    _headerResponse = null;

    prefs.remove('ff_authToken');
    prefs.remove('ff_userId');
    prefs.remove('ff_userName');
    prefs.remove('ff_userEmail');
    prefs.remove('ff_userTelephone');
    prefs.remove('ff_userProfilId');
    prefs.remove('ff_userIsActive');
    prefs.remove('ff_tokenExpiresAt');

    notifyListeners();
  }

  // Méthode utilitaire pour vérifier si l'utilisateur est connecté
  bool get isAuthenticated => _authToken.isNotEmpty && _userIsActive;

  // Méthode pour obtenir le nom d'affichage
  String get displayName => _userName.isNotEmpty ? _userName : 'Utilisateur';

  // Méthode pour vérifier si le token a expiré
  bool get isTokenExpired {
    if (_tokenExpiresAt.isEmpty) return false;
    try {
      final expiryDate = DateTime.parse(_tokenExpiresAt);
      return DateTime.now().isAfter(expiryDate);
    } catch (e) {
      return false;
    }
  }
}