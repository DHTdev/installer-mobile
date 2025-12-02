import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compenents/details/details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifs_model.dart';
export 'notifs_model.dart';

class NotifsWidget extends StatefulWidget {
  const NotifsWidget({
    super.key,
    this.notificationStatut,
    this.uuID,
    this.city,
    this.date,
    this.id,
    this.datePD,
    this.dateAF,
    this.etatTache,
    this.observation,
    this.matricule,
    this.imei,
    this.propietaire,
    this.sim,
    this.simPropietaire,
    this.clientName,
    this.cityName,
    this.catache,
    this.gpsPrincipal,
    this.nameModeleGPS,
    this.accessoiresModel,
    this.nameModelGPS,
    this.vehicule,
    this.telClient,
    this.nameModelSIM,
    Color? colorIndicator,
    Color? contentViewBG,
    this.onStatusUpdate,
  })  : this.colorIndicator = colorIndicator ?? const Color(0xFF39D2C0),
        this.contentViewBG = contentViewBG ?? const Color(0xFFF1F4F8);

  final int? notificationStatut;
  final int? uuID;
  final String? city;
  final String? date;
  final int? id;
  final String? datePD;
  final String? dateAF;
  final int? etatTache;
  final String? observation;
  final String? matricule;
  final String? imei;
  final int? propietaire;
  final String? sim;
  final String? simPropietaire;
  final String? clientName;
  final String? cityName;
  final String? catache;
  final int? gpsPrincipal;
  final String? nameModeleGPS;
  final String? accessoiresModel;
  final String? nameModelGPS;
  final String? vehicule;
  final String? telClient;
  final String? nameModelSIM;
  final Color colorIndicator;
  final Color contentViewBG;
  final Future Function()? onStatusUpdate;

  @override
  State<NotifsWidget> createState() => _NotifsWidgetState();
}

class _NotifsWidgetState extends State<NotifsWidget> {
  late NotifsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: DetailsWidget(
                  taskDetails: TechnicianTaskStruct(
                    id: widget.id,
                    datePrevisionnelleDebut: widget.datePD,
                    dateAffectation: widget.dateAF,
                    utiUtilsateurId: widget.uuID,
                    observation: widget.observation,
                    matricule: widget.matricule,
                    imei: widget.imei,
                    proprietaire: widget.propietaire,
                    sim: widget.sim,
                    sIMProprietaire: widget.simPropietaire,
                    clientName: widget.clientName,
                    cityName: widget.cityName,
                    catache: widget.catache,
                    gpsPrincipale: widget.gpsPrincipal,
                    etatTache: widget.etatTache,
                    telephoneClient: widget.telClient,
                    nameModeleGPS: widget.nameModeleGPS,
                    accesoriesModel: widget.accessoiresModel,
                    nameModeleSIM: widget.nameModelSIM,
                    vehicules: widget.vehicule,
                    notifificationStatus: widget.notificationStatut,
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          await TechnicienGroup.notificationUpdateCall.call(
            id: widget.id,
          );

          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.contentViewBG,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xFFE0E3E7),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 4.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: widget.colorIndicator,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.catache,
                              'Tache',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.clientName,
                              'Nom client',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.city!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.date!,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
