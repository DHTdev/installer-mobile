import '../components/notifs_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importez Provider
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_model.dart';
import 'notifications_provider.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'Notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;
  final FFAppState appState = FFAppState();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   final provider = context.read<NotificationProvider>();
    //   provider.clearNotifications();
    // });
    _model = createModel(context, () => NotificationsModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Utilisez Provider pour charger les données
      await context.read<NotificationProvider>().loadNotifications(appState.authToken);
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Consumer<NotificationProvider>(
            builder: (context, notificationProvider, child) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Notifications',
                          style: FlutterFlowTheme.of(context).headlineMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                            ),
                            fontSize: 23.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                        if (notificationProvider.unreadCount > 0) ...[
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${notificationProvider.unreadCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Bouton pour marquer tous comme lus
                  if (notificationProvider.unreadCount > 0)
                    IconButton(
                      icon: Icon(Icons.mark_email_read),
                      onPressed: () {
                        notificationProvider.markAllAsRead();
                      },
                      tooltip: 'Marquer tous comme lus',
                    ),
                ],
              );
            },
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Consumer<NotificationProvider>(
          builder: (context, notificationProvider, child) {
            return _buildBody(notificationProvider);
          },
        ),
      ),
    );
  }

  Widget _buildBody(NotificationProvider notificationProvider) {
    if (notificationProvider.isLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Chargement des notifications...'),
          ],
        ),
      );
    }

    if (notificationProvider.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 50, color: Colors.red),
            SizedBox(height: 16),
            Text(
              notificationProvider.errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                notificationProvider.loadNotifications(appState.authToken);
              },
              child: Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    if (notificationProvider.notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.notifications_none, size: 50, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Aucune notification disponible.',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        ),
      );
    }

    final notificationsTasks = notificationProvider.notifications.take(20).toList();

    return RefreshIndicator(
      onRefresh: () async {
        await notificationProvider.loadNotifications(appState.authToken);
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: notificationsTasks.length,
        itemBuilder: (context, index) {
          final notification = notificationsTasks[index];
          return wrapWithModel(
            model: _model.notifsModels.getModel(
              notification.id.toString(),
              index,
            ),
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: NotifsWidget(
              key: Key('Keyg8l_${notification.id.toString()}'),
              notificationStatut: notificationProvider.isRead(notification.id) ? 0 : notification.notifificationStatus,
              uuID: notification.uti_utilsateur_id,
              city: valueOrDefault<String>(notification.cityName, 'Ville'),
              date: notification.date_previsionnelle_debut,
              id: notification.id,
              datePD: notification.date_previsionnelle_debut,
              dateAF: notification.date_affectation,
              etatTache: notification.etatTache,
              observation: notification.observation,
              matricule: notification.matricule,
              imei: notification.IMEI,
              propietaire: notification.proprietaire,
              sim: notification.SIM,
              simPropietaire: notification.SIM_proprietaire,
              clientName: notification.clientName,
              cityName: notification.cityName,
              catache: notification.catache,
              gpsPrincipal: notification.gps_principale,
              nameModeleGPS: notification.nameModeleGPS,
              accessoiresModel: notification.accesoriesModel,
              nameModelGPS: notification.nameModeleGPS,
              telClient: notification.clientPhoneNumber,
              nameModelSIM: notification.nameModeleSIM,
              colorIndicator: notificationProvider.isRead(notification.id)
                  ? Color(0xA48B9898)
                  : FlutterFlowTheme.of(context).secondary,
              contentViewBG: notificationProvider.isRead(notification.id)
                  ? Color(0x96F1F4F8)
                  : FlutterFlowTheme.of(context).secondaryBackground,
              onStatusUpdate: () async {
                _model.updateTasksNotificationsAtIndex(
                  index,
                      (e) => e..notifificationStatus = 0,
                );
              },
            ),
          );
        },
      ),
    );
  }
}