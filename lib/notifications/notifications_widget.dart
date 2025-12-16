import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/notifs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_model.dart';
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResulto0f = await TechnicienGroup.tasksCall.call();

      if ((_model.apiResulto0f?.succeeded ?? true)) {
        _model.tasksNotifications = ((_model.apiResulto0f?.jsonBody ?? '')
                .toList()
                .map<TechnicianTaskStruct?>(TechnicianTaskStruct.maybeFromMap)
                .toList() as Iterable<TechnicianTaskStruct?>)
            .withoutNulls
            .toList()
            .cast<TechnicianTaskStruct>();
        safeSetState(() {});
      }
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
          title: Row(
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
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        fontSize: 23.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Builder(
          builder: (context) {
            final notificationsTasks =
                _model.tasksNotifications.toList().take(20).toList();

            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: notificationsTasks.length,
              itemBuilder: (context, notificationsTasksIndex) {
                final notificationsTasksItem =
                    notificationsTasks[notificationsTasksIndex];
                return wrapWithModel(
                  model: _model.notifsModels.getModel(
                    notificationsTasksItem.id.toString(),
                    notificationsTasksIndex,
                  ),
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NotifsWidget(
                    key: Key(
                      'Keyg8l_${notificationsTasksItem.id.toString()}',
                    ),
                    notificationStatut:
                        notificationsTasksItem.notifificationStatus,
                    uuID: notificationsTasksItem.utiUtilsateurId,
                    city: valueOrDefault<String>(
                      notificationsTasksItem.cityName,
                      'Ville',
                    ),
                    date: notificationsTasksItem.datePrevisionnelleDebut,
                    id: notificationsTasksItem.id,
                    datePD: notificationsTasksItem.datePrevisionnelleDebut,
                    dateAF: notificationsTasksItem.dateAffectation,
                    etatTache: notificationsTasksItem.etatTache,
                    observation: notificationsTasksItem.observation,
                    matricule: notificationsTasksItem.matricule,
                    imei: notificationsTasksItem.imei,
                    propietaire: notificationsTasksItem.proprietaire,
                    sim: notificationsTasksItem.sim,
                    simPropietaire: notificationsTasksItem.sIMProprietaire,
                    clientName: notificationsTasksItem.clientName,
                    cityName: notificationsTasksItem.cityName,
                    catache: notificationsTasksItem.catache,
                    gpsPrincipal: notificationsTasksItem.gpsPrincipale,
                    nameModeleGPS: notificationsTasksItem.nameModeleGPS,
                    accessoiresModel: notificationsTasksItem.accesoriesModel,
                    nameModelGPS: notificationsTasksItem.nameModeleGPS,
                    vehicule: notificationsTasksItem.vehicules,
                    telClient: notificationsTasksItem.telephoneClient,
                    nameModelSIM: notificationsTasksItem.nameModeleSIM,
                    colorIndicator:
                        notificationsTasksItem.notifificationStatus == 0
                            ? Color(0xA48B9898)
                            : FlutterFlowTheme.of(context).secondary,
                    contentViewBG:
                        notificationsTasksItem.notifificationStatus == 0
                            ? Color(0x96F1F4F8)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                    onStatusUpdate: () async {
                      _model.updateTasksNotificationsAtIndex(
                        notificationsTasksIndex,
                        (e) => e..notifificationStatus = 0,
                      );
                      safeSetState(() {});
                      safeSetState(() {});
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
