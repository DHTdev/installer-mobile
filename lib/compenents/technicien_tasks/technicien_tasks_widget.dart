import '/backend/schema/structs/index.dart';
import '/compenents/details/details_widget.dart';
import '/compenents/manage_taches/manage_taches_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'technicien_tasks_model.dart';
export 'technicien_tasks_model.dart';

class TechnicienTasksWidget extends StatefulWidget {
  const TechnicienTasksWidget({
    super.key,
    required this.id,
    String? clientName,
    String? taskType,
    required this.date,
    String? city,
    int? stateTask,
    required this.TechnicianTask,
  })  : 
        this.clientName = clientName ?? '',
        this.taskType = taskType ?? ' ',
        this.city = city ?? '',
        this.stateTask = stateTask ?? 1;

  final int id;
  final String clientName;
  final String taskType;
  final DateTime? date;
  final String city;
  final int stateTask;
  final TechnicianTaskStruct TechnicianTask;

  @override
  State<TechnicienTasksWidget> createState() => _TechnicienTasksWidgetState();
}

class _TechnicienTasksWidgetState extends State<TechnicienTasksWidget> {
  late TechnicienTasksModel _model;
  TechnicianTaskStruct? taskItem;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechnicienTasksModel());
     taskItem = TechnicianTaskStruct(
      id: widget.id,
      clientName: widget.clientName,
      catache: widget.taskType,
      etatTache: widget.stateTask,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onLongPress: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: DetailsWidget(
                    key: Key('details_${widget.TechnicianTask.id}'),
                    detailsTask: widget.TechnicianTask,
                    
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 199.74,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(
                    0,
                    2,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional(0, -1),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        widget.TechnicianTask.clientName,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'tâche',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  34, 0, 0, 0),
                                          child: Text(
                                            widget.TechnicianTask.catache,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'Date',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  38, 0, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.TechnicianTask.date_previsionnelle_debut.toString(),
                                              '01/01/2025',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'Ville',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40, 0, 0, 0),
                                          child: Text(
                                            widget.TechnicianTask.cityName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1, -1),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.showMenu = !_model.showMenu;
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.ellipsisV,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 100,
                            height: 31,
                            decoration: BoxDecoration(
                              color: () {
                                if (widget.TechnicianTask.etatTache == 0) {
                                  return FlutterFlowTheme.of(context).alternate;
                                } else if (widget.TechnicianTask.etatTache == 1) {
                                  return FlutterFlowTheme.of(context).alternate;
                                } else if (widget.TechnicianTask.etatTache == 2) {
                                  return FlutterFlowTheme.of(context).secondary;
                                } else if (widget.TechnicianTask.etatTache == 3) {
                                  return FlutterFlowTheme.of(context).error;
                                } else {
                                  return FlutterFlowTheme.of(context).error;
                                }
                              }(),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  () {
                                    if (widget.TechnicianTask.etatTache == 0) {
                                      return 'en attendant';
                                    } else if (widget.TechnicianTask.etatTache == 1) {
                                      return 'en coure ';
                                    } else if (widget.TechnicianTask.etatTache == 2) {
                                      return 'terminé';
                                    } else if (widget.TechnicianTask.etatTache == 3) {
                                      return 'reporter';
                                    } else {
                                      return 'annuler';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                    ],
                  ),
                ),
                if (_model.showMenu)
                  AnimatedOpacity(
                    opacity: 0.9,
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    child: Align(
                      alignment: AlignmentDirectional(0.83, 0),
                      child: wrapWithModel(
                        model: _model.manageTachesModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ManageTachesWidget(
                          task: taskItem,
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
