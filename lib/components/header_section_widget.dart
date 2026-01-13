import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_installer/notifications/notifications_widget.dart';
import 'package:provider/provider.dart'; // Ajout de l'import Provider

import '../backend/api_requests/api_calls.dart';
import '../notifications/notifications_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_section_model.dart';
export 'header_section_model.dart';

class HeaderSectionWidget extends StatefulWidget {
  const HeaderSectionWidget({super.key});

  @override
  State<HeaderSectionWidget> createState() => _HeaderSectionWidgetState();
}

class _HeaderSectionWidgetState extends State<HeaderSectionWidget> {
  late HeaderSectionModel _model;
  bool _isLoggingOut = false;
  FFAppState appState = FFAppState();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderSectionModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<NotificationProvider>();
      final appState = FFAppState();

      if (provider.notifications.isEmpty) {
        await provider.loadNotifications(appState.authToken);
      }
    });
  }

  Future<void> _handleLogout() async {
    if (_isLoggingOut) return;

    setState(() {
      _isLoggingOut = true;
    });

    try {
      print('Début du logout...');

      final baseUrl = AuthentificationGroup.getBaseUrl();
      final dio = Dio();
      final cookieJar = CookieJar();
      dio.interceptors.add(CookieManager(cookieJar));

      // Récupérer le CSRF token
      await dio.get('${baseUrl}/sanctum/csrf-cookie');

      final cookies = await cookieJar.loadForRequest(Uri.parse('${baseUrl}/'));
      final csrfToken = cookies.firstWhere((cookie) => cookie.name == "XSRF-TOKEN").value;
      final decodeToken = Uri.decodeComponent(Uri.decodeComponent(csrfToken));

      // Configurer les headers
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-XSRF-TOKEN": decodeToken,
        "Authorization": "Bearer ${appState.authToken}",
      };

      // Appeler l'API logout
      final response = await dio.post('${baseUrl}/logout');

      print('✅ Logout API réussi - Status: ${response.statusCode}');

      appState.clearUserData();
      // Nettoyage local
      appState.authToken = '';
      appState.update(() {});

      if (mounted) {
        context.read<NotificationProvider>().clearNotifications();
      }

      // Navigation
      if (mounted) {
        context.goNamed(
          AuthentificationWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
      }

    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print('✅ Token révoqué avec succès (401)');
      } else {
        print('⚠️ Erreur API: ${e.response?.statusCode}');
      }

      // Dans tous les cas, déconnexion locale
      appState.authToken = '';
      appState.update(() {});
      appState.clearUserData();
      if (mounted) {
        context.read<NotificationProvider>().clearNotifications();
        context.goNamed(
          AuthentificationWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
      }
    } catch (e) {
      print('❌ Exception: $e');
      appState.authToken = '';
      appState.update(() {});
      appState.clearUserData();

      if (mounted) {
        context.read<NotificationProvider>().clearNotifications();

        context.goNamed(
          AuthentificationWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoggingOut = false;
        });
      }
    }
  }
  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    final unreadCount = notificationProvider.unreadCount;

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour ${appState.displayName}',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                      ),
                      Text(
                          DateFormat('HH:mm EEE MMM dd yyyy').format(DateTime.now()),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Badge avec notification
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationsWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.notifications_active,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                          // Badge du nombre de notifications
                          if (unreadCount > 0)
                            Positioned(
                              right: -6,
                              top: -6,
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                constraints: BoxConstraints(
                                  minWidth: 20.0,
                                  minHeight: 20.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    unreadCount > 300 ? '98+' : unreadCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 2.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: _isLoggingOut ? null : _handleLogout,
                          child: Icon(
                            Icons.exit_to_app_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}