import '/compenents/manage_taches/manage_taches_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'technicien_tasks_widget.dart' show TechnicienTasksWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TechnicienTasksModel extends FlutterFlowModel<TechnicienTasksWidget> {
  ///  Local state fields for this component.

  String clientName = 'A H BETON';

  String taskType = 'installation gasoil';

  DateTime? date;

  String city = 'tanger';

  int stateTask = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
