import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_installer/tache/taches/taches_widget.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentification_model.dart';
export 'authentification_model.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class AuthentificationWidget extends StatefulWidget {
  final String? x_xsrf_token;
  AuthentificationWidget({super.key, required this.x_xsrf_token});

  static String routeName = 'Authentification';
  static String routePath = '/authentification';

  @override
  State<AuthentificationWidget> createState() => _AuthentificationWidgetState();
}

class _AuthentificationWidgetState extends State<AuthentificationWidget> {
  late AuthentificationModel _model;
  late String? cookie;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFAppState appState = FFAppState();
  bool _chargement = false;
  String? _errorMessage;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthentificationModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  Future<void> login() async {
    if (_validateInputs() == false) return;
    setState(() {
      _chargement = true;
      _errorMessage = null;
    });
    try {
      final baseUrl = AuthentificationGroup.getBaseUrl();
      final dio = Dio();
      final cookieJar = CookieJar();
      dio.interceptors.add(CookieManager(cookieJar));
      await dio.get('${baseUrl}/sanctum/csrf-cookie');
      final cookies =
          await cookieJar.loadForRequest(Uri.parse('${baseUrl}/'));
      final csrfToken =
          cookies.firstWhere((cookie) => cookie.name == "XSRF-TOKEN").value;
      final decodeToken = Uri.decodeComponent(Uri.decodeComponent(csrfToken));
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-XSRF-TOKEN": decodeToken,
      };
      final loggedUser = await dio.post(
        '${baseUrl}/login',
        data: {"email": _model.userName, "password": _model.password},
      );
      debugPrint(
        const JsonEncoder.withIndent('  ').convert(loggedUser.data),
      );
      if (loggedUser.statusCode == 200) {
        final token = loggedUser.data["token"];
        if (token != null && token is String) {
          appState.authToken = token;

          await saveFcmToken(
            authToken: token,
            baseUrl: baseUrl,
          );

          if (mounted) {
             context.pushReplacementNamed(TachesWidget.routeName);
          }
        } else {
          throw Exception('Token non reçu du serveur');
        }
      } else {
        throw Exception('Erreur serveur: ${loggedUser.statusCode}');
      }
      appState.authToken = loggedUser.data["token"];
        context.pushReplacementNamed(TachesWidget.routeName);
      setState(() {
        _chargement = false;
      });
    } catch (e) {
      // print("error:${e}");
      if (e is DioException) {
        final data = e.response?.data;
        final message = data is Map && data['message'] != null
            ? data['message']
            : 'Erreur de connexion';
        _showError(message);
      }else{
        debugPrint('Erreur de login: $e');
        _showError('Une erreur inattendue est survenue');
      }

    }finally {
      if (mounted) {
        setState(() => _chargement = false);
      }
    }
  }

  bool _validateInputs() {
    final email = _model.emailAddressTextController.text.trim();
    final password = _model.passwordTextController.text.trim();

    if (email.isEmpty) {
      _showError('Veuillez entrer votre nom d\'utilisateur');
      return false;
    }

    if (password.isEmpty) {
      _showError('Veuillez entrer votre mot de passe');
      return false;
    }

    // Validation basique d'email
    if (!email.contains('@') && !_isValidUsername(email)) {
      _showError('Veuillez entrer une adresse email ou un nom d\'utilisateur valide');
      return false;
    }

    return true;
  }

  bool _isValidUsername(String username) {
    return username.length >= 3 && RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username);
  }
  void _showError(String message) {
    if (mounted) {
      setState(() => _errorMessage = message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
  Future<Map<String, String?>> getDeviceInfos() async {
    final deviceInfo = DeviceInfoPlugin();
    String? platform;
    String? deviceName;

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      platform = 'android';
      deviceName = '${android.brand} ${android.model}';
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      platform = 'ios';
      deviceName = ios.name;
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();

    return {
      'token': fcmToken,
      'platform': platform,
      'device_name': deviceName,
    };
  }

  Future<void> saveFcmToken({
    required String authToken,
    required String baseUrl,
  }) async {
    try {
      final deviceData = await getDeviceInfos();

      if (deviceData['token'] == null) {
        debugPrint('FCM token null, skip saveToken');
        return;
      }

      final dio = Dio();
      await dio.post(
        '$baseUrl/api/fcm/save-token',
        data: {
          'token': deviceData['token'],
          'platform': deviceData['platform'],
          'device_name': deviceData['device_name'],
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Accept': 'application/json',
          },
        ),
      );

      debugPrint('FCM token enregistré');
    } catch (e) {
      debugPrint('Erreur saveToken: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFFFFFFF),
          body: Stack(
            children: [
              SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: 100.0,
                        height: double.infinity,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mobile-installer-8g06wc/assets/cjq2sfwrkgn6/N26kO7S50xfR9u8LwQy5.png',
                                          width: 169.0,
                                          height: 79.3,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 100.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                'Sign In',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                  ),
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                              child: Container(
                                                width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.9,
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .emailAddressTextController,
                                                    focusNode:
                                                    _model.emailAddressFocusNode,
                                                    autofocus: false,
                                                    autofillHints: [
                                                      AutofillHints.email
                                                    ],
                                                    onChanged: (_) => {
                                                      setState(() {
                                                        _model.userName = _model
                                                            .emailAddressTextController
                                                            .text;
                                                      })
                                                    },
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nom d’utilisateur ',
                                                      labelStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .labelLarge
                                                          .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelLarge
                                                              .fontWeight,
                                                          fontStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelLarge
                                                              .fontStyle,
                                                        ),
                                                        color:
                                                        Color(0xFF959595),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .fontWeight,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .fontStyle,
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color(0xFFEFEFEF),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(12.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(12.0),
                                                      ),
                                                      errorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(12.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(12.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                    ),
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                      ),
                                                      color: Color(0xFF959595),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                      fontStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                    ),
                                                    keyboardType:
                                                    TextInputType.emailAddress,
                                                    validator: _model
                                                        .emailAddressTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                              child: Container(
                                                width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.9,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      onChanged: (_) => {
                                                        setState(() {
                                                          _model.password = _model
                                                              .passwordTextController
                                                              .text;
                                                        })
                                                      },
                                                      controller:
                                                      _model.passwordTextController,
                                                      focusNode:
                                                      _model.passwordFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText:
                                                      !_model.passwordVisibility,
                                                      decoration: InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle: FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .labelLarge
                                                                .fontWeight,
                                                            fontStyle:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .labelLarge
                                                                .fontStyle,
                                                          ),
                                                          color: Color(0xFF959595),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelLarge
                                                              .fontWeight,
                                                          fontStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelLarge
                                                              .fontStyle,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Color(0xFFEFEFEF),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        suffixIcon: InkWell(
                                                          onTap: () => safeSetState(
                                                                () => _model
                                                                .passwordVisibility =
                                                            !_model
                                                                .passwordVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal: true),
                                                          child: Icon(
                                                            _model.passwordVisibility
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                            color: Color(0xFF757575),
                                                            size: 22,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                          fontStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                        ),
                                                        color:
                                                        Color(0xFF959595),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                      ),
                                                      keyboardType:
                                                      TextInputType.emailAddress,
                                                      validator: _model
                                                          .passwordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  login();
                                                },
                                                text: 'Sign In',
                                                options: FFButtonOptions(
                                                  width:
                                                  MediaQuery.sizeOf(context).width *
                                                      0.9,
                                                  height: 46.69,
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  color: Color(0xFF07C491),
                                                  textStyle: FlutterFlowTheme.of(
                                                      context)
                                                      .titleSmall
                                                      .override(
                                                    font: GoogleFonts.interTight(
                                                      fontWeight:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .titleSmall
                                                          .fontWeight,
                                                      fontStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .titleSmall
                                                          .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                    fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                                  ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(12.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// LOADER GLOBAL
              if (_chargement)
                Container(
                  color: Colors.black.withOpacity(0.3), // overlay
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Patientez...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ),
    );
  }
}
