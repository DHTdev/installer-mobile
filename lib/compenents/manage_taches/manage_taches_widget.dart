import 'package:mobile_installer/tache/appareils/pannes/panne_g_p_s/panne_g_p_s_widget.dart';
import 'package:mobile_installer/tache/appareils/pannes/panne_relais/panne_relais_widget.dart';
import 'package:mobile_installer/tache/appareils/pannes/panne_s_i_m/panne_s_i_m_widget.dart';
import 'package:mobile_installer/tache/canceled_task/canceled_task_widget.dart';
import 'package:mobile_installer/tache/tchesreporte/tchesreporte_widget.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'manage_taches_model.dart';
export 'manage_taches_model.dart';

class ManageTachesWidget extends StatefulWidget {
  const ManageTachesWidget({
    super.key,
    required this.task,
  });

  /// the selected task to end
  final TechnicianTaskStruct? task;

  @override
  State<ManageTachesWidget> createState() => _ManageTachesWidgetState();
}

class _ManageTachesWidgetState extends State<ManageTachesWidget> {
  late ManageTachesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageTachesModel());
  }

  void navigateTo() {
    switch (widget.task?.catache) {
      case "installation" || "installation gasoil":
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => TacheTerminerWidget(infoTask: widget.task),
          ),
        );
      case "desinstalation":
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => DesinstallationWidget(infoTask: widget.task),
          ),
        );
      case "Reinstallation":
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => TacheTerminerWidget(infoTask: widget.task),
          ),
        );
      case "Changement du GPS":
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => PanneGPSWidget(infoTask: widget.task),
            ));
      case "Changement du SIM":
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) =>
                  PanneSIMWidget(clientName: widget.task?.clientName),
            ));
        ;
      case "reparationRelais":
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) =>
                  PanneRelaisWidget(clientName: widget.task?.clientName),
            ));
      case "Panne":
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) =>
                  PanneWidget(clientName: widget.task?.clientName),
            ));
        ;
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.5,
      height: 160,
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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        EditTachesWidget(infoTask: widget.task),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Icon(
                          Icons.edit_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Edit',
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                navigateTo();
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Icon(
                          Icons.task_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Terminer',
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => TchesreporteWidget(
                          id: widget.task?.id,
                          clientName: widget.task?.clientName),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Icon(
                          Icons.replay,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Reporter',
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          CanceledTaskWidget(infoTask: widget.task),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Icon(
                          Icons.cancel,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Anuler',
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
          ],
        ),
      ),
    );
  }
}
